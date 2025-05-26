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

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class ShowRefreshIndicatorOnFirstRenderWrapper extends StatefulWidget {
  const ShowRefreshIndicatorOnFirstRenderWrapper({
    required this.refreshKey,
    required this.child,
    super.key,
  });

  final GlobalKey<RefreshIndicatorState> refreshKey;
  final Widget child;

  @override
  State<ShowRefreshIndicatorOnFirstRenderWrapper> createState() =>
      _ShowRefreshIndicatorOnFirstRenderWrapperState();
}

class _ShowRefreshIndicatorOnFirstRenderWrapperState
    extends State<ShowRefreshIndicatorOnFirstRenderWrapper>
    with AfterLayoutMixin<ShowRefreshIndicatorOnFirstRenderWrapper> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    widget.refreshKey.currentState?.show();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
