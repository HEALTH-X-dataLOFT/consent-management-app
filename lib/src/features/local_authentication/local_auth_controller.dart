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

import 'package:consent_management_app/src/features/local_authentication/local_auth_service.dart';
import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocalAuthController {
  LocalAuthController();

  final LocalAuthService _localAuthService = Get.find<LocalAuthService>();
  final MethodChannel _channel = const MethodChannel('biometric/settings');

  /// variable to track, if user request to follow setting a password/biometrics flow
  bool _hasOpenedBiometricsSettings = false;

  Future<void> openBiometricSettings(MethodChannel channel) async {
    try {
      await channel.invokeMethod('openBiometricSettings');
      _hasOpenedBiometricsSettings = true;
    } on PlatformException catch (e) {
      _hasOpenedBiometricsSettings = true;
      logger.e("Failed to open biometric settings: ${e.message}");
      rethrow;
    }
  }

  Future<bool> isUserIdentityValid({required String localizedReason}) async {
    try {
      final result =
          await _localAuthService.performDeviceAuthentication(localizedReason);
      if (result == LocalAuthenticationState.dismissedEnterAuth) {
        SystemNavigator.pop();
        return false;
      } else if (result == LocalAuthenticationState.canceledSetupAuthMethod) {
        try {
          if (!_hasOpenedBiometricsSettings) {
            await openBiometricSettings(_channel);
            return true;
          } else {
            return false;
          }
        } catch (e) {
          logger.e("Failed to open biometric settings: $e");
          return false;
        }
      } else if (result == LocalAuthenticationState.authenticated) {
        return true;
      } else if (result == LocalAuthenticationState.unauthenticated) {
        return false;
      }
    } catch (e) {
      logger.e("Error during identity check $e");
      return false;
    }
    return false;
  }
}
