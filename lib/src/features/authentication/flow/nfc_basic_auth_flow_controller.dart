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

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:consent_management_app/src/common/data/secure_storage_service.dart';
import 'package:consent_management_app/src/common/models/storage_item.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/authentication/flow/auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/models/id_card.dart';
import 'package:consent_management_app/src/features/authentication/models/invitation.dart';
import 'package:consent_management_app/src/features/authentication/models/user.dart';
import 'package:consent_management_app/src/features/onboarding/onboard_service.dart';
import 'package:consent_management_app/src/routing/authguard.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:get/get.dart';

class NfcBasicAuthFlowController extends AuthFlowController {
  NfcBasicAuthFlowController({required super.router});

  final authService = Get.find<AuthService<String>>();
  final secureStorage = Get.find<SecureStorageService>();
  final onboardingService = Get.find<OnboardingService>();
  Invitation? invitation;
  IdCard? idCard;

  @override
  void startAuthFlow({required VoidCallback onComplete}) {
    super.startAuthFlow(onComplete: onComplete);
    checkOnboarding(() {
      router.push(QrScanViewRoute(onConfirm: onConfirmQrScanView));
    });
  }

  Future<void> checkOnboarding(VoidCallback onComplete) async {
    final onboarded = await onboardingService.isUserOnboarded();
    if (!onboarded) {
      router.push(
        WelcomeOnboardingViewRoute(
          onConfirm: () async {
            router.push(MainOnboardingViewRoute(onConfirm: onComplete));
          },
        ),
      );
    } else {
      onComplete();
    }
  }

  Future<void> onConfirmQrScanView() async {
    invitation = await router
        .push<Invitation>(const BarcodeScannerWithOverlayViewRoute());
    if (invitation != null) {
      logger.d("invitenation: ${invitation!.toMap()}");
      router.push(NfcInfoViewRoute(onConfirm: onConfirmNfcInfoView));
    }
  }

  Future<void> onConfirmNfcInfoView() async {
    router.push(NfcScanViewRoute(onConfirm: onConfirmScanView));
  }

  Future<void> onConfirmScanView() async {
    idCard = await router.push<IdCard>(const NfcScanModalViewRoute());
    if (idCard != null) {
      logger.d("idCard: ${idCard!.toMap()}");
      if (_validateNfcInfoAgainstInvitation()) {
        router.push(NfcFinishViewRoute(onConfirm: onConfirmNfcFinishView));
      } else {
        logger.e("idCard and invitation do not math");
      }
    }
  }

  Future<void> onConfirmNfcFinishView() async {
    final user = User(
      username: invitation!.username,
      password: invitation!.password,
    );
    final encoded = jsonEncode(user);
    await secureStorage.write(StorageItem(User.storageKey, encoded));
    router.push(const LoadingScreenViewRoute());
    await authService.login();
    onAuthenticationComplete();
  }

  bool _validateNfcInfoAgainstInvitation() {
    return invitation!.matchesIdCard(idCard!);
  }
}
