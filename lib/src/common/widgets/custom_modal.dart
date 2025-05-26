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

class CustomModal extends StatelessWidget {
  const CustomModal({
    required this.child,
    super.key,
    this.barrierDismissible = false,
  });

  final Widget? child;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () =>
                barrierDismissible ? Navigator.of(context).pop() : () {},
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
