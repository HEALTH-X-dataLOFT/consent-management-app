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

import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService extends GetxService {
  static const _onboardingStatusKey = 'onboarding_status';
  final isUserOnboardedObs = false.obs;

  late SharedPreferences prefs;

  Future<OnboardingService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> isUserOnboarded() async {
    if (prefs.getString(_onboardingStatusKey) == null) {
      return false;
    }

    return prefs.getString(_onboardingStatusKey) == 'onboarded';
  }

  Future<bool> onboardUser() async {
    try {
      prefs.setString(_onboardingStatusKey, 'onboarded');
      isUserOnboardedObs.value = true;
      return true;
    } catch (e, s) {
      logger.e("Error while save onboard state: $e");
      logger.e("Stacktrace: $s");
      return false;
    }
  }

  Future<bool> offboardUser() async {
    try {
      prefs.setString(_onboardingStatusKey, 'needs-login-data');
      return true;
    } catch (e, s) {
      logger.e("Error while save onboard state: $e");
      logger.e("Stacktrace: $s");
      return false;
    }
  }
}
