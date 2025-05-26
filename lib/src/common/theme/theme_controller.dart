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
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();

  final String _key = "themeMode";

  Rx<ThemeMode> theme = ThemeMode.system.obs;

  ThemeMode? _loadThemeFromStorage() {
    final map = {
      "system": ThemeMode.system,
      "dark": ThemeMode.dark,
      "light": ThemeMode.light,
    };
    final preference = _storage.read(_key);
    return map.containsKey(preference) ? map[preference] : ThemeMode.system;
  }

  ThemeMode get getTheme {
    final storedTheme = _loadThemeFromStorage();
    return storedTheme == null
        ? theme.value = ThemeMode.system
        : theme.value = storedTheme;
  }

  void switchTheme(ThemeMode? newThemeMode) {
    theme.value = newThemeMode!;
    Get.changeThemeMode(newThemeMode);
    saveTheme(newThemeMode.name);
  }

  void saveTheme(String themeMode) => _storage.write(_key, themeMode);
}
