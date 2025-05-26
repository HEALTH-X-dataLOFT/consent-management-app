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

import 'package:card_swiper/card_swiper.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scroller extends StatefulWidget {
  const Scroller({
    required this.swiperController,
    required this.scrollerIndex,
    super.key,
  });
  final SwiperController swiperController;
  final void Function(int index) scrollerIndex;

  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  _ScrollerState();

  final SettingsService settingsService = Get.find<SettingsService>();
  late final SwiperController swiperController;
  int currentIndex = 0;

  final List<String> imagePaths = [];
  final List<String> titles = [];
  final List<String> bodies = [];

  @override
  void initState() {
    super.initState();
    swiperController = widget.swiperController;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        final localizations = context.l10n;
        setState(() {
          if (settingsService.studyMode) {
            imagePaths.addAll([
              'assets/images/screen_3_onboarding.png',
              'assets/images/screen_4_onboarding.png',
              'assets/images/screen_5_onboarding.png',
              'assets/images/screen_6_onboarding.png',
            ]);
            titles.addAll([
              localizations.onboardingTitle2,
              localizations.onboardingTitle3,
              localizations.onboardingTitle4,
              localizations.onboardingTitle5,
            ]);
            bodies.addAll([
              localizations.onboardingMainText2,
              localizations.onboardingMainText3,
              localizations.onboardingMainText4,
              localizations.onboardingMainText5Study,
            ]);
          } else {
            imagePaths.addAll([
              'assets/images/screen_2_onboarding.png',
              'assets/images/screen_3_onboarding.png',
              'assets/images/screen_4_onboarding.png',
              'assets/images/screen_5_onboarding.png',
            ]);
            titles.addAll([
              localizations.onboardingTitle1,
              localizations.onboardingTitle2,
              localizations.onboardingTitle3,
              localizations.onboardingTitle4,
            ]);
            bodies.addAll([
              localizations.onboardingMainText1,
              localizations.onboardingMainText2,
              localizations.onboardingMainText3,
              localizations.onboardingMainText4,
            ]);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Swiper(
          onIndexChanged: (index) {
            setState(() {
              widget.scrollerIndex(index);
            });
          },
          outer: true,
          loop: false,
          itemCount: imagePaths.length,
          itemBuilder: (BuildContext context, int index) {
            return Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        titles[index],
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineLarge,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 23.0,
                      right: 10.0,
                      left: 10.0,
                    ),
                    child: Text(
                      bodies[index],
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            );
          },
          autoplay: false,
          pagination: SwiperPagination(
            margin: constraints.maxHeight > 700
                ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0)
                : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
            builder: DotSwiperPaginationBuilder(
              color: const Color.fromARGB(255, 248, 199, 124),
              activeColor: Theme.of(context).colorScheme.primary,
              size: 12.0,
              activeSize: 12.0,
            ),
          ),
          controller: swiperController,
        );
      },
    );
  }
}
