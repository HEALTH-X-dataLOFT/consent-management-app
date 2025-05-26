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

import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/features/documents/preview/bloc/preview_bloc.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/default_providers.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/preview_provider.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/preview_debug_overlay.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/thumbnail_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    required this.providerFile,
    super.key,
  });

  final ProviderFile providerFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.natural87,
      ),
      child: AspectRatio(
        // This ratio is derived from the design
        aspectRatio: 1.26,
        child: BlocProvider(
          create: (context) => PreviewBloc.initial(
            providers: defaultProviders,
            mode: PreviewMode.thumbnail,
            providerFile: providerFile,
          ),
          child: const Stack(
            fit: StackFit.passthrough,
            alignment: AlignmentDirectional.center,
            children: [
              ThumbnailContent(),
              Positioned(
                bottom: 0,
                right: 0,
                child: PreviewDebugOverlay(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
