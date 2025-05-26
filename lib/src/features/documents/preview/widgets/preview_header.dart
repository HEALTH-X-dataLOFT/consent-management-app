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
import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/features/documents/preview/bloc/preview_bloc.dart';
import 'package:consent_management_app/src/features/documents/widgets/mime_type_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewHeader extends StatelessWidget {
  const PreviewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: BlocSelector<PreviewBloc, PreviewState, ProviderFile>(
        selector: (state) => state.providerFile,
        builder: (context, providerFile) {
          return Row(
            children: [
              Flexible(
                child: Tooltip(
                  message: providerFile.name,
                  child: Text(
                    providerFile.name!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
                height: 0,
              ),
              MimeTypeBadge(mimeType: providerFile.mimeType ?? ""),
            ],
          );
        },
      ),
    );
  }
}
