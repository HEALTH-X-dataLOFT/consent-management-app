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

import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({required this.controller, super.key});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SearchBar(
        hintText: context.l10n.hinted_search_text,
        controller: controller,
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onSubmitted: (String onSubmitted) {},
        leading: const Icon(Icons.menu),
        trailing: const <Widget>[Icon(Icons.search)],
      ),
    );
  }
}
