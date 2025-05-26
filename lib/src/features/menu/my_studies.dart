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
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/features/menu/menu_item.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class MyStudiesView extends StatelessWidget {
  const MyStudiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 20),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    AppMenuListItem(
                      isDisabled: false,
                      onTap: () =>
                          context.router.push(const StudiesListViewRoute()),
                      title: TextSpan(
                        text: context.l10n.menuStudiesTitle,
                        style: context.textTheme.titleMedium,
                      ),
                      subTitle:
                          TextSpan(text: context.l10n.menuStudiesSubTitle),
                      graphic: const VectorGraphic(
                        loader: AssetBytesLoader(
                          'assets/images/svg/menu_studies_pana.svg',
                        ),
                        height: 120,
                        width: 120,
                      ),
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 32),
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(0.7),
                        BlendMode.dstIn,
                      ),
                      child: AppMenuListItem(
                        onTap: () {},
                        title: TextSpan(
                          text: context.l10n.menuGuidelinesTitle,
                          style: context.textTheme.titleMedium,
                        ),
                        subTitle:
                            TextSpan(text: context.l10n.menuGuidelinesSubTitle),
                        graphic: const VectorGraphic(
                          loader: AssetBytesLoader(
                            'assets/images/svg/menu_guidelines_pana.svg',
                          ),
                          height: 120,
                          width: 120,
                        ),
                        icon: Icons.library_books,
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
