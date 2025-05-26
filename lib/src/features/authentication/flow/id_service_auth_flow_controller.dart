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
import 'dart:convert';

import 'package:consent_management_app/src/common/data/secure_storage_service.dart';
import 'package:consent_management_app/src/common/models/storage_item.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/authentication/flow/auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/models/user.dart';
import 'package:consent_management_app/src/features/onboarding/onboard_service.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

class IdServiceAuthFlowController extends AuthFlowController {
  IdServiceAuthFlowController({required super.router});

  final authService = Get.find<AuthService<String>>();
  final secureStorage = Get.find<SecureStorageService>();
  final logger = Logger();
  final onboardingService = Get.find<OnboardingService>();
  String? loginData;

  @override
  void startAuthFlow({required VoidCallback onComplete}) {
    super.startAuthFlow(onComplete: onComplete);
    checkOnboarding(() {
      router.push(NfcInfoViewRoute(onConfirm: onConfirmNfcInfoView));
    });
  }

  Future<void> checkOnboarding(VoidCallback onComplete) async {
    final onboarded = await onboardingService.isUserOnboarded();
    if (!onboarded) {
      router.push(
        WelcomeOnboardingViewRoute(
          onConfirm: () {
            router.push(MainOnboardingViewRoute(onConfirm: onComplete));
          },
        ),
      );
    } else {
      onComplete();
    }
  }

  Future<void> onConfirmNfcInfoView() async {
    router.push(NfcScanViewRoute(onConfirm: onConfirmScanView));
  }

  Future<void> onConfirmScanView() async {
    loginData = await router.push<String>(const IdScanModalViewRoute());
    if (loginData != null) {
      if (loginData == "ERROR") {
        logger.d("Authentication failed: ${loginData!}");
      } else {
        logger.d("loginData: ${loginData!}");
        router.push(NfcFinishViewRoute(onConfirm: onConfirmNfcFinishView));
      }
    }
  }

  Future<void> onConfirmNfcFinishView() async {
    final jsonData = json.decode(loginData!);
    final user = User(
      username: jsonData!.username,
      password: jsonData!.password,
    );
    final encoded = jsonEncode(user);
    await secureStorage.write(StorageItem(User.storageKey, encoded));
    router.push(const LoadingScreenViewRoute());
    await authService.login();
    onAuthenticationComplete();
  }
}
