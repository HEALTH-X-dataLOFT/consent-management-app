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

import 'dart:ui';

import 'package:consent_management_app/src/common/data/secure_storage_service.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/authentication/errors/exception.dart';
import 'package:consent_management_app/src/features/authentication/flow/auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/oidc/oidc_web_auth_service.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/features/local_authentication/local_auth_service.dart';
import 'package:consent_management_app/src/features/onboarding/onboard_service.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:get/get.dart';

class OidcWebAuthFlowController extends AuthFlowController {
  OidcWebAuthFlowController({required super.router});

  OidcWebAuthService oidcAuthService =
      Get.find<AuthService<String>>() as OidcWebAuthService;
  final secureStorage = Get.find<SecureStorageService>();
  final onboardingService = Get.find<OnboardingService>();

  final LocalAuthService _localAuthService = Get.find<LocalAuthService>();
  @override
  void startAuthFlow({required VoidCallback onComplete}) {
    super.startAuthFlow(onComplete: onComplete);
    checkOnboarding(oidcWebLogin);
  }

  Future<void> checkOnboarding(VoidCallback onComplete) async {
    final onboarded = await onboardingService.isUserOnboarded();
    if (!onboarded) {
      _localAuthService.isReturningFromWebView = true;
      router.push(
        WelcomeOnboardingViewRoute(
          onConfirm: () {
            router.push(MainOnboardingViewRoute(onConfirm: onComplete));
          },
        ),
      );
    } else {
      onComplete();
      _localAuthService.isReturningFromWebView = true;
    }
  }

  Future<void> oidcWebLogin() async {
    try {
      router.push(const LoadingScreenViewRoute());
      final bool result = await oidcAuthService.login() &&
          await oidcAuthService.hasRole("verifiedUser");

      if (result) {
        _localAuthService.isReturningFromWebView = false;
        onAuthenticationComplete();
      } else {
        authFlowStarted = false;
        onComplete = null;
        router.push(
          ContactStudyStaffViewRoute(
            onConfirm: () {
              oidcAuthService
                  .logout()
                  .then((_) => router.replaceAll([MenuViewRoute()]));
            },
          ),
        );
      }
    } on CancelAuthenticationException catch (_) {
      if (router.pageCount < 1) {
        // redirect to error view no page to go back
        router.replaceAll([const ErrorViewRoute()]);
      } else {}
    } on NoUserAgentException catch (_) {
      router.replaceAll([const ErrorViewRoute()]);
    } on UnableToLoadDiscoveryDocument catch (_) {
      router.replaceAll([const NoConnectionErrorViewRoute()]);
    } catch (e, s) {
      logger.e("Error while login: $e");
      logger.e("Stacktrace: $s");
      router.replaceAll([const ErrorViewRoute()]);
      rethrow;
    }
  }
}
