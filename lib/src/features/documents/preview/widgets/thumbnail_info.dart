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
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ThumbnailInfo extends StatelessWidget {
  const ThumbnailInfo({
    required this.icon,
    required this.label,
    super.key,
  });

  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.textBodyHigh,
    );

    return DefaultTextStyle(
      style: textStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              size: 48,
              color: textStyle.color,
            ),
            child: icon,
          ),
          const SizedBox(width: 0, height: 9),
          label,
        ],
      ),
    );
  }
}
