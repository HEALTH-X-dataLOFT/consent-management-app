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
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class NfcFinishView extends StatelessWidget {
  const NfcFinishView({
    required this.onConfirm,
    super.key,
  });

  final VoidCallback onConfirm;

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
                const SizedBox(
                  height: 35,
                ),
                Text(
                  "${context.l10n.onlineIdFunction}"
                  "\n${context.l10n.nfcSuccess}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Flexible(
                  flex: 5,
                  child: SizedBox(
                    height: 510,
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                        'assets/images/svg/Successful purchase-pana 1.svg',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    width: 201,
                    child: FilledButton(
                      onPressed: onConfirm,
                      child: Text(
                        context.l10n.onboardingNextButton,
                        style: context.textTheme.titleMedium,
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
