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

ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary50,
  onPrimary: AppColors.natural900_100,
  primaryContainer: AppColors.primary95,
  primaryFixed: AppColors.primary80,
  secondary: AppColors.secondary50,
  onSecondary: AppColors.white,
  error: AppColors.errorColor,
  onError: AppColors.white,
  surface: AppColors.natural98,
  surfaceBright: AppColors.lightGrey,
  surfaceDim: AppColors.natural98,
  surfaceContainerLowest: AppColors.natural100,
  surfaceContainerLow: AppColors.natural96,
  surfaceContainer: AppColors.natural94,
  surfaceContainerHigh: AppColors.natural92,
  surfaceContainerHighest: AppColors.natural90,
  onSurface: AppColors.natural10,
  onSurfaceVariant: AppColors.natural30,
  outline: AppColors.naturalVariant50,
  outlineVariant: AppColors.naturalVariant80,
);

TextStyle baseTextStyle = const TextStyle(
  color: AppColors.natural700_100,
  fontFamily: 'Roboto',
);

TextTheme lightTextTheme = TextTheme(
  displayLarge: baseTextStyle.copyWith(
    fontSize: 57,
    height: 64 / 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    color: AppColors.natural900_100,
  ),
  displayMedium: baseTextStyle.copyWith(
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.w400,
    color: AppColors.natural900_100,
  ),
  displaySmall: baseTextStyle.copyWith(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w400,
    color: AppColors.natural900_100,
  ),
  headlineLarge: baseTextStyle.copyWith(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w400,
    color: AppColors.natural900_100,
  ),
  headlineMedium: baseTextStyle.copyWith(
    fontSize: 24,
    height: 36 / 28,
    fontWeight: FontWeight.w400,
    color: AppColors.natural900_100,
  ),
  headlineSmall: baseTextStyle.copyWith(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w400,
    color: AppColors.natural900_100,
  ),
  titleLarge: baseTextStyle.copyWith(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: baseTextStyle.copyWith(
    fontSize: 15,
    height: 24 / 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleSmall: baseTextStyle.copyWith(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  labelLarge: baseTextStyle.copyWith(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: AppColors.natural700_75,
  ),
  labelMedium: baseTextStyle.copyWith(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  ),
  labelSmall: baseTextStyle.copyWith(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: baseTextStyle.copyWith(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: baseTextStyle.copyWith(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  bodySmall: baseTextStyle.copyWith(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  ),
);

SearchBarThemeData searchBarTheme = SearchBarThemeData(
  elevation: WidgetStateProperty.all(0),
  backgroundColor: WidgetStateProperty.all(AppColors.natural98),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: AppColors.white,
  textTheme: lightTextTheme,
  searchBarTheme: searchBarTheme,
);

ThemeData darkTheme = lightTheme.copyWith();

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary40 = Color(0xFFEC8033);
  static const Color primary50 = Color(0xFFFF9902);
  static const Color primary95 = Color(0xFFFFFAF2);
  static const Color primary80 = Color(0xffffd69a);
  static const Color secondary50 = Color(0xFFb7781d);
  static const Color natural900_100 = Color(0xFF0d0f11);
  static const Color natural700_45 = Color(0x73323B46);
  static const Color natural700_75 = Color(0xBF323B46);
  static const Color natural700_100 = Color(0xFF323B46);
  static const Color natural10 = Color(0xFF181716);
  static const Color natural30 = Color(0xFF484541);
  static const Color natural87 = Color(0xFFE4E3E2);
  static const Color natural90 = Color(0xFFe6e0e9);
  static const Color natural92 = Color(0xFFece6f0);
  static const Color natural94 = Color(0xFFf3edf7);
  static const Color natural96 = Color(0xFFf7f2fa);
  static const Color natural98 = Color(0xFFf8f8f8);
  static const Color natural100 = AppColors.white;
  static const Color naturalVariant50 = Color(0xFF79747e);
  static const Color naturalVariant80 = Color(0xFFcac4d0);
  static const Color textBodyHigh = Color(0xFF3E3E3E);
  static const Color errorColor = Color(0xFFB3261E);
  static const Color lightGrey = Color(0xFFFEFEFE);
  static const Color lightShadowGray = Color(0xFFF5F5F5);
  static const Color mediumShadowGray = Color(0xFFE0E0E0);
}
