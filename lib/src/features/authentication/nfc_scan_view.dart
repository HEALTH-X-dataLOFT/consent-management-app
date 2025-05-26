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
import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/features/authentication/nfc/widgets/phone.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class NfcScanView extends StatefulWidget {
  const NfcScanView({
    required this.onConfirm,
    super.key,
  });
  final VoidCallback onConfirm;

  @override
  State<NfcScanView> createState() => _NfcScanViewState();
}

class _NfcScanViewState extends State<NfcScanView> {
  @override
  Future<void> dispose() async {
    NfcManager.instance.stopSession();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: AppColors.primary95,
          appBar: AppBar(
            titleSpacing: 0,
            title: GestureDetector(
              onTap: () => context.router.maybePop(),
              child: Text(
                context.l10n.backButton,
                style: context.textTheme.labelLarge,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                context.router.maybePop();
              },
              child: const Row(
                children: [
                  SizedBox(
                    width: 23,
                  ),
                  Icon(Icons.arrow_back, color: AppColors.natural700_75),
                ],
              ),
            ),
            backgroundColor: AppColors.primary95,
          ),
          body: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 35),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    context.l10n.onlineIdFunction,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 45),
                ),
                const Expanded(
                  flex: 6,
                  child: Phone(),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      context.l10n.idScanRequest,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Container(
                    margin: const EdgeInsets.only(top: 61),
                    width: 59.w,
                    height: Adaptive.h(6.8),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: context.textTheme.titleMedium,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: AppColors.textBodyHigh,
                      ),
                      onPressed: widget.onConfirm,
                      child: Text(
                        context.l10n.startScan,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
