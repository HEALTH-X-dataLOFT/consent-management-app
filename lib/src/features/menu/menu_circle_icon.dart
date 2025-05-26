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

import 'package:flutter/material.dart';

class AppMenuCircleIcon extends StatelessWidget {
  const AppMenuCircleIcon({
    required this.icon,
    required this.isDisabled,
    super.key,
  });

  final IconData icon;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDisabled
            ? Theme.of(context).colorScheme.outlineVariant.withOpacity(0.4)
            : Theme.of(context).colorScheme.primary,
      ),
      child: Icon(icon),
    );
  }
}
