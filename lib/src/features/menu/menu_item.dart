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

import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/features/menu/menu_circle_icon.dart';
import 'package:flutter/material.dart';

class AppMenuListItem extends StatelessWidget {
  const AppMenuListItem({
    required this.title,
    required this.subTitle,
    required this.graphic,
    required this.icon,
    super.key,
    this.onTap,
    this.isDisabled = false,
  });

  final TextSpan title;
  final TextSpan subTitle;
  final Widget graphic;
  final IconData icon;
  final void Function()? onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.outlined(
        margin: EdgeInsets.zero,
        color: isDisabled
            ? context.colorScheme.surfaceContainerHighest
            : context.colorScheme.primaryContainer,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: title),
                        RichText(
                          text: TextSpan(
                            children: [subTitle],
                            style: context.defaultTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppMenuCircleIcon(
                    icon: icon,
                    isDisabled: isDisabled,
                  ),
                ],
              ),
            ),
            Center(child: graphic),
          ],
        ),
      ),
    );
  }
}
