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

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:consent_management_app/src/common/widgets/custom_modal.dart';
import 'package:consent_management_app/src/features/authentication/models/id_card.dart';
import 'package:consent_management_app/src/features/authentication/nfc/widgets/scan_process_dialog.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

@RoutePage()
class NfcScanModalView extends StatefulWidget {
  const NfcScanModalView({super.key});

  @override
  State<NfcScanModalView> createState() => _NfcScanModalViewState();
}

class _NfcScanModalViewState extends State<NfcScanModalView> {
  @override
  void initState() {
    super.initState();
    _startScanning(context);
  }

  @override
  Future<void> dispose() async {
    NfcManager.instance.stopSession();
    super.dispose();
  }

  Future<void> _startScanning(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        IdCard? idCard;
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            try {
              final ndef = Ndef.from(tag);
              if (ndef == null) throw Exception('No NDEF tag');
              final data = await ndef.read();
              final text = utf8.decode(data.records.first.payload).substring(3);
              final jsonData = json.decode(text);
              logger.d("Got RFID jsondata: $jsonData");
              idCard = IdCard.fromMap(jsonData);
              if (context.mounted) {
                context.router.maybePop(idCard);
              }
            } catch (error) {
              logger.e("Got an error when trying to convert data: $error");
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: ScanProcessDialog(
            errorTitle: context.l10n.scanProcessError,
            errorCancelButtonText: context.l10n.cancel,
            errorConfirmButtonText: context.l10n.tryAgain,
            successTitle: context.l10n.scanProcessInfo,
            onClose: () => context.router.maybePop(),
          ),
        ),
      ),
    );
  }
}
