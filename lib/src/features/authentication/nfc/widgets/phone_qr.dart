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
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PhoneQR extends StatelessWidget {
  const PhoneQR({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final double baseLeft = constraint.maxWidth / 4;
        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: baseLeft + 9,
                top: 9,
                child: Container(
                  height: 368,
                  width: 174.5,
                  color: AppColors.white,
                ),
              ),
              Positioned(
                left: baseLeft + 30,
                top: 45,
                child: Text(
                  context.l10n.qrInvitation,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Positioned(
                left: baseLeft + 160,
                top: 45,
                child: const Icon(
                  Icons.more_vert,
                  size: 15,
                ),
              ),
              Positioned(
                left: baseLeft + 37,
                top: 125,
                child: const VectorGraphic(
                  loader: AssetBytesLoader(
                    'assets/images/svg/qr.svg',
                  ),
                  height: 125,
                  width: 125,
                ),
              ),
              Positioned(
                left: baseLeft,
                child: const VectorGraphic(
                  loader: AssetBytesLoader(
                    'assets/images/svg/smartphone.svg',
                  ),
                  height: 387,
                  width: 192,
                ),
              ),
              Positioned(
                left: baseLeft + 28.5,
                top: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 135,
                    height: 35.5,
                    color: context.colorScheme.primary,
                    child: Center(
                      child: Text(
                        context.l10n.scanAction,
                        style: const TextStyle(
                          fontSize: 9,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
