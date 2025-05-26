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
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_graphics/vector_graphics.dart';

class IdCardStack extends StatelessWidget {
  const IdCardStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 213,
      height: 142,
      child: Stack(
        children: [
          const Positioned(
            top: 15,
            left: 13,
            child: IdCard(
              color: AppColors.lightShadowGray,
            ),
          ),
          const Positioned(
            top: 7.5,
            left: 6.5,
            child: IdCard(
              color: AppColors.mediumShadowGray,
            ),
          ),
          IdCard(
            color: AppColors.primary40,
            child: Stack(
              children: [
                const Positioned(
                  top: 14.5,
                  left: 16.5,
                  child: CircleAvatar(
                    radius: 49.5 / 2,
                    backgroundColor: Colors.white,
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                        'assets/images/svg/id_silhouette.svg',
                      ),
                      height: 21,
                      width: 21,
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 95,
                  child: Text(
                    AppLocalizations.of(context)!.idWidgetName,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IdCard extends StatelessWidget {
  const IdCard({
    required this.color,
    super.key,
    this.width = 200,
    this.height = 127,
    this.edgeRadius = 7.0,
    this.child,
  });

  final Color color;
  final double width;
  final double height;
  final double edgeRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(edgeRadius),
      child: Container(
        width: width,
        height: height,
        color: color,
        child: child,
      ),
    );
  }
}
