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
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/menu/menu_item.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:logger/logger.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

Logger logger = Logger();

@RoutePage()
class MenuView extends StatelessWidget {
  final _authService = Get.find<AuthService<String>>();
  final settingsService = Get.find<SettingsService>();

  MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            top: 20,
            bottom: 25,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VectorGraphic(
                    loader: AssetBytesLoader(
                      'assets/images/svg/healthx_logo.svg',
                    ),
                    alignment: Alignment.center,
                    height: 60,
                  ),
                  const Spacer(),
                  if (!settingsService.studyMode)
                    Opacity(
                      opacity: 0.6,
                      child: IconButton(
                        onPressed: () {},
                        iconSize: 30.00,
                        icon: const Icon(Icons.mail_outlined),
                      ),
                    ),
                  /*PopupMenuButton<String>(
                    onSelected: (string) {
                      switch (string) {
                        case 'Logout':
                          _authService.logout();
                          break;
                        default:
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Logout'}.map((String choice) {
                        return PopupMenuItem<String>(
                          textStyle: context.textTheme.labelLarge,
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  )*/
                  // ONLY FOR DEMO
                  IconButton(
                    onPressed: () {
                      _authService.logout().then((_) {
                        AutoRouter.of(context).push(MenuViewRoute());
                      });
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    AppMenuListItem(
                      onTap: () =>
                          AutoRouter.of(context).push(MyDataViewRoute()),
                      title: TextSpan(
                        text: context.l10n.menuDataTitle,
                        style: context.textTheme.titleMedium,
                      ),
                      subTitle: TextSpan(text: context.l10n.menuDataSubTitle),
                      graphic: const VectorGraphic(
                        loader: AssetBytesLoader(
                          'assets/images/svg/personal_file_pana.svg',
                        ),
                        height: 130,
                        width: 100,
                      ),
                      icon: Icons.person,
                      isDisabled: false,
                    ),
                    const SizedBox(height: 24),
                    if (!settingsService.studyMode)
                      AppMenuListItem(
                        onTap: () => AutoRouter.of(context)
                            .push(const MyStudiesViewRoute()),
                        title: TextSpan(
                          text: context.l10n.menuStudyTitle,
                          style: context.textTheme.titleMedium,
                        ),
                        subTitle:
                            TextSpan(text: context.l10n.menuStudySubTitle),
                        graphic: const VectorGraphic(
                          loader: AssetBytesLoader(
                            'assets/images/svg/public_health_pana.svg',
                          ),
                          height: 150,
                          width: 100,
                        ),
                        icon: Icons.book,
                        isDisabled: false,
                      ),
                    const SizedBox(height: 24),
                    if (!settingsService.studyMode)
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.7),
                          BlendMode.dstIn,
                        ),
                        child: AppMenuListItem(
                          title: TextSpan(
                            text: context.l10n.menuSettingsTitle,
                            style: context.textTheme.titleMedium,
                          ),
                          subTitle:
                              TextSpan(text: context.l10n.menuSettingsSubTitle),
                          graphic: const VectorGraphic(
                            loader: AssetBytesLoader(
                              'assets/images/svg/mobile_login_pana.svg',
                            ),
                            height: 120,
                            width: 120,
                          ),
                          icon: Icons.settings,
                          isDisabled: true,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
