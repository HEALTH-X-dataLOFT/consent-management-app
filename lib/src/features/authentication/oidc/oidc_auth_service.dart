///  ```dart
/// Copyright 2025 HEALTH-X dataLOFT
///
/// Licensed under the European Union Public Licence, Version 1.2 (the
/// "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     https://eupl.eu/1.2/en/
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
library;

import 'package:consent_management_app/src/common/data/connectivity_service.dart';
import 'package:consent_management_app/src/common/data/database_service.dart';
import 'package:consent_management_app/src/common/data/secure_storage_service.dart';
import 'package:consent_management_app/src/features/authentication/auth_event.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/authentication/errors/exception.dart';
import 'package:consent_management_app/src/features/authentication/models/authentication_data.dart';
import 'package:consent_management_app/src/utils/jwt_tools.dart';
import 'package:consent_management_app/src/features/local_authentication/local_auth_service.dart';
import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oidc/oidc.dart';
import 'package:rxdart/rxdart.dart';

mixin OidcAuthService implements AuthService<String> {
  final OidcUserManager oidcManager = Get.find<OidcUserManager>();
  final ConnectivityService connectivityService =
      Get.find<ConnectivityService>();
  final SecureStorageService secureStorage = Get.find<SecureStorageService>();
  final DatabaseService databaseService = Get.find<DatabaseService>();
  final LocalAuthService _localAuthService = Get.find<LocalAuthService>();

  @override
  Future<bool> login() async {
    final connectivityState = await connectivityService.checkConnectivity();
    try {
      final user = await performOidcLogin();
      if (user != null) {
        logger.d("Authenticated: ${user.idToken}");
        return true;
      } else {
        throw const GeneralAuthenticationException();
      }
    } on PlatformException catch (e, s) {
      if (e.code == 'authorize_failed') {
        if (e.message != null && e.message!.contains("User cancelled flow")) {
          throw CancelAuthenticationException(
            causingException: e,
            causingStackTrace: s,
          );
        }
      } else if (e.code == 'no_browser_available') {
        throw NoUserAgentException(
          causingException: e,
          causingStackTrace: s,
        );
      }
      rethrow;
    } on OidcException catch (e, s) {
      if (e.message.contains("Couldn't fetch the discoveryDocument")) {
        throw UnableToLoadDiscoveryDocument(
          causingException: e,
          causingStackTrace: s,
          request: e.rawRequest,
          response: e.rawResponse,
        );
      }
      if (e.message.contains("discoveryDocument hasn't been fetched yet")) {
        if (!connectivityState.hasInternet) {
          throw UnableToLoadDiscoveryDocument(
            causingException: e,
            causingStackTrace: s,
            request: e.rawRequest,
            response: e.rawResponse,
          );
        }
        throw UnableToLoadDiscoveryDocument(
          causingException: e,
          causingStackTrace: s,
          request: e.rawRequest,
          response: e.rawResponse,
        );
      }
      rethrow;
    } catch (e, s) {
      logger.e("Error while login: $e");
      logger.e("Stacktrace: $s");
      if (e is AuthenticationException) {
        rethrow;
      }
      throw GeneralAuthenticationException(
        causingException: e,
        causingStackTrace: s,
      );
    }
  }

  Future<OidcUser?> performOidcLogin();

  @override
  Future<void> logout() async {
    _localAuthService.isReturningFromWebView = true;
    await secureStorage.deleteAll();
    await databaseService.flushAssets();
    await oidcManager.logout();
  }

  @override
  Future<AuthenticationData> get authenticationData async {
    OidcUser? user = currentUser;
    if (user == null) {
      throw StateError(
          'Trying to get the user outside of authenticated context: '
          'consider call isAuthenticated before to be sure');
    }

    if (user.token.isAccessTokenExpired()) {
      logger.w(
        'Expired access token reached OIDC Auth Service, even though it should have been refreshed by the OIDC library',
      );
      user = await oidcManager.refreshToken();
    }

    if (user == null) {
      throw StateError(
          'Trying to get the user outside of authenticated context: '
          'consider call isAuthenticated before to be sure');
    }
    return AuthenticationData(
      accessToken: user.idToken,
      expiresIn: user.token.expiresIn?.inSeconds ?? 0,
      refreshExpiresIn: 0,
      refreshToken: user.token.refreshToken ?? '',
      tokenType: user.token.tokenType ?? '',
      notBeforePolicy: 0,
      sessionState: '',
      scope: '',
    );
  }

  @override
  Future<void> handleAuthErrorResponse() async {
    final user = await oidcManager.refreshToken();
    if (user == null) {
      await oidcManager.forgetUser();
    }
  }

  @override
  Stream<AuthEvent> get events => oidcManager
      .events()
      .map(
        (event) =>
            event.runtimeType == OidcPreLogoutEvent ? AuthEvent.logout : null,
      )
      .whereNotNull();

  @override
  Future<bool> isAuthenticated() async {
    return currentUser != null;
  }

  @override
  Future<bool> hasRole(String roleName) async {
    final String? token = accessToken;

    if (token == null) {
      return false;
    }

    return parseJWTClaims(token)['realm_access']['roles'].contains(roleName);
  }

  @override
  Future<String> buildUserCredentials(String key) async {
    final token = (await authenticationData).token;
    return encryptJWT(key, token);
  }

  OidcUser? get currentUser => oidcManager.currentUser;

  String? get accessToken => currentUser?.token.accessToken;
}
