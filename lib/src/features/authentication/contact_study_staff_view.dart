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
import 'package:flutter/material.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class ContactStudyStaffView extends StatelessWidget {
  const ContactStudyStaffView({required this.onConfirm, super.key});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 17.0, left: 17.0, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                child: VectorGraphic(
                  loader: AssetBytesLoader(
                    'assets/images/svg/Insurance-pana 1.svg',
                  ),
                ),
              ),
              Text(
                context.l10n.dataVerificationTitle,
                style: context.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45),
              Text(
                context.l10n.dataVerificationSubtitle,
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 75),
              SizedBox(
                width: 201,
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    backgroundColor: context.colorScheme.primary,
                  ),
                  onPressed: onConfirm,
                  child: Text(
                    context.l10n.agree,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 47.0),
            ],
          ),
        ),
      ),
    );
  }
}
