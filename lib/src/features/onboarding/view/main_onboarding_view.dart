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
import 'package:card_swiper/card_swiper.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/features/onboarding/onboard_service.dart';
import 'package:consent_management_app/src/features/onboarding/scroller.dart';
import 'package:consent_management_app/src/features/onboarding/scroller_controller.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class MainOnboardingView extends StatelessWidget {
  final SwiperController _swiperController = SwiperController();
  final scrollerController = Get.put(ScrollerController());
  final onboardingService = Get.find<OnboardingService>();

  final VoidCallback onConfirm;

  MainOnboardingView({
    required this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const int lastScreen = 3;
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                scrollerController.scroller.value = 0;
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
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            actions: [
              TextButton(
                onPressed: () {
                  _swiperController.move(lastScreen);
                },
                child: Obx(() {
                  return scrollerController.scroller.value == 3
                      ? Container()
                      : Row(
                          children: [
                            Text(
                              context.l10n.onboardingSkipButton,
                              style: context.textTheme.labelLarge,
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.natural700_75,
                            ),
                          ],
                        );
                }),
              ),
            ],
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, left: 10),
                        child: Scroller(
                          swiperController: _swiperController,
                          scrollerIndex: _setCurrentPageIndex,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 180,
                        height: 47,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primary50,
                            foregroundColor: AppColors.textBodyHigh,
                          ),
                          onPressed: () => _getCurrentPageByIndex(context),
                          child: Text(
                            AppLocalizations.of(context)!.continueButton,
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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

  void _getCurrentPageByIndex(BuildContext context) {
    if (scrollerController.scroller.value == 3) {
      onboardingService.onboardUser();
      onConfirm();
    } else {
      _swiperController.next();
    }
  }

  // ignore: use_setters_to_change_properties
  void _setCurrentPageIndex(int currentIdx) {
    scrollerController.scroller.value = currentIdx;
  }
}
