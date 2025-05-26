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

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

enum LocalAuthenticationState {
  authenticated,
  unsupportedBiometric,
  dismissedEnterAuth,
  unauthenticated,
  canceledSetupAuthMethod
}

///The service handles local authentication using Password, Pattern, or Biometric verification
class LocalAuthService extends GetxService {
  LocalAuthService();

  /// Set a variable to track when authentication should be skipped (returning from WebView)
  bool isReturningFromWebView = false;

  final LocalAuthentication localAuth = LocalAuthentication();
  bool isAuthenticationSuccessful = false;

  Future<LocalAuthenticationState> performDeviceAuthentication(
    String localizedReason,
  ) async {
    final bool canCheckBiometrics = await localAuth.canCheckBiometrics;

    if (!canCheckBiometrics) {
      return LocalAuthenticationState.unsupportedBiometric;
    }
    try {
      isAuthenticationSuccessful =
          await localAuth.authenticate(localizedReason: localizedReason);
      if (isAuthenticationSuccessful) {
        return LocalAuthenticationState.authenticated;
      } else {
        return LocalAuthenticationState
            .dismissedEnterAuth; //when user refuse enter/use password, biometric authentication
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        logger.e("Error during local authentication $e");
        return LocalAuthenticationState.canceledSetupAuthMethod;
      } else {
        logger.e("Error during local authentication $e");
        return LocalAuthenticationState.unauthenticated;
      }
    }
  }
}
