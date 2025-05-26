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
import 'package:consent_management_app/src/features/documents/preview/provider/preview_provider.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/fallback_thumbnail.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThumbnailContent extends StatelessWidget {
  const ThumbnailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewBloc, PreviewState>(
      builder: (context, state) {
        switch (state) {
          case final PreviewReady s:
            return Container(
              key: state.key,
              child: s.provider.build(
                context: context,
                prepared: state.prepared,
                providerFile: state.providerFile,
                onError: context
                    .read<PreviewBloc>()
                    .createHandleError(state.provider),
                mode: PreviewMode.thumbnail,
                // Intermediate fallbacks are the same as loading to make error
                // handling via next provider invisible.
                fallback: Container(),
              ),
            );

          case final PreviewLoaded _:
          case final PreviewLoading _:
            return Container();

          case final PreviewNotAvailable _:
            return const FallbackThumbnail();
        }
      },
    );
  }
}
