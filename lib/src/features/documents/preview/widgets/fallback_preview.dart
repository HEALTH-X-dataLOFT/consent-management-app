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
import 'package:consent_management_app/src/features/documents/preview/bloc/preview_bloc.dart';
import 'package:consent_management_app/src/features/documents/preview/utils/provider_file_download_open.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/thumbnail_info.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FallbackPreview extends StatelessWidget {
  const FallbackPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ThumbnailInfo(
          icon: const Icon(Icons.image_not_supported_outlined),
          label: Text(context.l10n.noThumbnailAvailable),
        ),
        BlocSelector<PreviewBloc, PreviewState, ProviderFile>(
          selector: (state) => state.providerFile,
          builder: (context, providerFile) {
            final download = providerFile.download;
            if (download == null) {
              return Container();
            }

            return GestureDetector(
              onTap: download.open,
              child: const Text("Open in external application"),
            );
          },
        ),
      ],
    );
  }
}
