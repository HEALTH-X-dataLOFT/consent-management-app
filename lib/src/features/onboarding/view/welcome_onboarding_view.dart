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

@RoutePage()
class WelcomeOnboardingView extends StatelessWidget {
  const WelcomeOnboardingView({required this.onConfirm, super.key});
  static const int smallScreenHeight = 700;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: constraints.maxHeight * 0.04),
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.2,
                        child: Text(
                          context.l10n.onboardingWelcomeTitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.displaySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: constraints.maxHeight > smallScreenHeight
                                ? 100
                                : 80,
                            height: constraints.maxHeight > smallScreenHeight
                                ? 100
                                : 80,
                            child: const Image(
                              image: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                          const Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, left: 10),
                        child: const Image(
                          image: AssetImage(
                            'assets/images/screen_1_onboarding.png',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 61),
                        width: 180,
                        height: 47,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primary50,
                            foregroundColor: AppColors.textBodyHigh,
                          ),
                          onPressed: onConfirm,
                          child: Text(
                            AppLocalizations.of(context)!
                                .onboardingRegisterButton,
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
