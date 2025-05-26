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

import 'package:consent_management_app/src/features/documents/preview/bloc/preview_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewDebugOverlay extends StatelessWidget {
  const PreviewDebugOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return Container();

    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: BlocBuilder<PreviewBloc, PreviewState>(
          builder: (context, state) {
            return Text(
              switch (state) {
                final PreviewLoading _ => "Loading",
                final PreviewLoaded _ => "Loaded Data",
                final PreviewReady<dynamic> s =>
                  "Ready: ${s.provider.runtimeType}",
                final PreviewNotAvailable _ => "Not available",
              },
              style: const TextStyle(
                color: Colors.white,
                inherit: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
