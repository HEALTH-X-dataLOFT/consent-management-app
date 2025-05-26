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

import 'package:consent_management_app/src/common/widgets/progress_spinner.dart';
import 'package:flutter/material.dart';

class ProgressIconButton extends StatelessWidget {
  final IconData icon;
  final bool isLoading;
  final Future<void> Function()? onPressed;

  const ProgressIconButton({
    required this.icon,
    required this.isLoading,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressSpinner(),
            )
          : IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
    );
  }
}
