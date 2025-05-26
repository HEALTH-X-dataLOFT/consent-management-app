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
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: AppColors.primary95,
          appBar: AppBar(
            backgroundColor: AppColors.primary95,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        context.l10n.error,
                        textAlign: TextAlign.center,
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Image.asset('assets/images/healthX_logo.png'),
                    ),
                    Expanded(
                      flex: 6,
                      child: Image.asset('assets/images/error_view.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        context.l10n.errorOccurred,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: FittedBox(
                        child: Container(
                          margin: const EdgeInsets.only(top: 61),
                          width: 48.w,
                          height: Adaptive.h(6.5),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: context.textTheme.titleMedium,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              AutoRouter.of(context).replaceAll(
                                [MenuViewRoute()],
                              );
                            },
                            child: Text(context.l10n.backToLogin),
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

@RoutePage()
class NoConnectionErrorView extends StatelessWidget {
  const NoConnectionErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: AppColors.primary95,
          appBar: AppBar(
            backgroundColor: AppColors.primary95,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        context.l10n.noConnectionError,
                        textAlign: TextAlign.center,
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Image.asset('assets/images/healthX_logo.png'),
                    ),
                    Expanded(
                      flex: 6,
                      child:
                          Image.asset('assets/images/no_connection_pana.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        context.l10n.noConnectionerrorOccurred,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: FittedBox(
                        child: Container(
                          margin: const EdgeInsets.only(top: 61),
                          width: 48.w,
                          height: Adaptive.h(6.5),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: context.textTheme.titleMedium,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              AutoRouter.of(context).replaceAll(
                                [MenuViewRoute()],
                              );
                            },
                            child: Text(context.l10n.backToLogin),
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
