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

import 'package:auto_route/auto_route.dart';
import 'package:consent_management_app/src/common/widgets/custom_modal.dart';
import 'package:consent_management_app/src/features/authentication/awa_service.dart';
import 'package:consent_management_app/src/features/authentication/nfc/widgets/scan_process_dialog.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

@RoutePage()
class IdScanModalView extends StatefulWidget {
  const IdScanModalView({super.key});

  @override
  State<IdScanModalView> createState() => _IdScanModalViewState();
}

class _IdScanModalViewState extends State<IdScanModalView> {
  final AwaService _awaService = AwaService();

  static const String onPinRequested = 'onPinRequested';
  static const String onAuthSuccessful = 'onAuthSuccessful';
  static const String onWriteMessage = 'onWriteMessage';
  static const String onAuthError = 'onAuthError';

  @override
  void initState() {
    super.initState();
    _awaService.setMethodCallHandler(_nativeMethodCallHandler);
    _startScanning(context);
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  Future<void> _startScanning(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          final String result = await _awaService.startIdScan();
          logger.d("Got ID scan result: $result");
        } catch (error) {
          logger.e("Got an error when trying to scan ID: $error");
        }
      },
    );
  }

  Future<dynamic> _nativeMethodCallHandler(MethodCall call) async {
    switch (call.method) {
      case onPinRequested:
        await _showPinDialog();
      case onAuthSuccessful:
        final String result = call.arguments as String? ?? 'No Data';
        logger.d("Auth successful: $result");
        if (context.mounted) {
          context.router.maybePop(result);
        }
      case onAuthError:
        final String result = call.arguments as String? ?? 'No Data';
        logger.d("Auth Error: $result");
        if (context.mounted) {
          Fluttertoast.showToast(
            msg: context.l10n.idScanFailed,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          context.router.maybePop("ERROR");
        }
      case onWriteMessage:
        final String result = call.arguments as String? ?? 'No Data';
        logger.d("Write message: $result");
      default:
        debugPrint('Unimplemented method: ${call.method}');
    }
    return null;
  }

  Future<void> _showPinDialog() async {
    final settingsService = Get.find<SettingsService>();
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        String pinTemp = '';
        String kvnrTemp = '';
        return AlertDialog(
          title: const Text('Please enter PIN and KVNR'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                onChanged: (value) => pinTemp = value,
                decoration: const InputDecoration(labelText: 'PIN'),
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) => kvnrTemp = value,
                decoration: const InputDecoration(labelText: 'KVNR'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop({'pin': pinTemp, 'kvnr': kvnrTemp});
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (result == null || result['pin']!.isEmpty || result['kvnr']!.isEmpty) {
      logger.d('PIN or KVNR input canceled or empty.');
      return;
    }

    await _awaService.sendPin(result['pin']!);
    await _awaService.sendKvnr(result['kvnr']!);
    await _awaService.sendOnboarderUrl(settingsService.onboarderUrl);
    logger.d('PIN, KVNR, and URLs were sent to Java.');
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
            errorConfirmButtonText: context.l10n.tryAgain,
            successTitle: context.l10n.scanProcessInfo,
            errorCancelButtonText: context.l10n.errorOccurred,
            onClose: () => context.router.maybePop(),
          ),
        ),
      ),
    );
  }
}
