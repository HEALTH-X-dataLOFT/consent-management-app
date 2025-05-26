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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Equivalent to the native [Icon] widget, but for svg assets.
/// The only required property is the [path] to the SVG asset.
/// The icon is styled based on the [IconTheme], allowing it to participate in
/// slotted composition.
///
/// As an example of composition, the following InfoBox widget takes a label and
/// icon property and provides styling via the [IconTheme] context. The same can
/// be done for [Text] widgets via [DefaultTextStyle].
///
/// ```dart
/// InfoBox(
///   icon: SvgIcon(path: "assets/images/no_thumbnail.svg"),
///   label: Text("Demo text"),
/// );
/// ```
///
/// The [IconTheme] can be injected like this:
/// ```dart#
/// IconTheme(
///   data: IconThemeData(
///     size: 48,
///     color: Colors.red,
///   ),
///   child: icon,
/// ),
/// ```
///
/// Provided [size] and [fill] take precedence over [IconTheme] and can be used
/// if the icon isn't used in composition.
class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.path,
    super.key,
    this.size,
    this.fill,
  });

  /// Path to the svg asset.
  final String path;

  /// Square bounding box size, takes precedent over [IconThemeData.size].
  final double? size;

  /// Fill color, takes precedent over [IconThemeData.color].
  final Color? fill;

  @override
  Widget build(BuildContext context) {
    final theme = context.iconTheme;
    final actualSize = size ?? theme.size;
    final actualFill = fill ?? theme.color ?? Colors.black;

    return SvgPicture.asset(
      path,
      width: actualSize,
      height: actualSize,
      theme: SvgTheme(
        currentColor: actualFill,
      ),
    );
  }
}
