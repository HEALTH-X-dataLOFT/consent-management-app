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

import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:flutter/material.dart';

class MimeTypeBadge extends StatelessWidget {
  const MimeTypeBadge({
    required this.mimeType,
    super.key,
  });

  final String mimeType;

  @override
  Widget build(BuildContext context) {
    final List<String> parts = mimeType.split("/");
    final formatted = parts.isNotEmpty ? parts.last.toUpperCase() : '';

    if (formatted.isEmpty) {
      return Container();
    }

    return Badge(
      label: Text(formatted),
      textColor: AppColors.natural10,
      backgroundColor: AppColors.primary80,
    );
  }
}
