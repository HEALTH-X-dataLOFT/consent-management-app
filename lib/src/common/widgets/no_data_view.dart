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
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NoDownloadsView extends StatelessWidget {
  const NoDownloadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    context.l10n.noDownloadsTitle,
                    style: context.textTheme.headlineMedium,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  textAlign: TextAlign.center,
                  softWrap: true,
                  context.l10n.noDownloadsSubtitle,
                  style: context.textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Flexible(
                child: Center(child: Image.asset('assets/images/no_data.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
