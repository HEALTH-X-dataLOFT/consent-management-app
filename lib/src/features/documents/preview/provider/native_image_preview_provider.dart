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

import 'dart:typed_data';

import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/preview_provider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class NativeImagePreviewProvider extends PreviewProvider<ImageProvider> {
  @override
  bool canHandle({
    required String mimeType,
    required Uint8List data,
    required ProviderFile providerFile,
    required PreviewMode mode,
  }) =>
      mimeType.startsWith("image/");

  @override
  Future<ImageProvider> prepare(
    Uint8List data, {
    required ProviderFile providerFile,
    required PreviewMode mode,
  }) async =>
      MemoryImage(data);

  @override
  Widget build({
    required BuildContext context,
    required ImageProvider prepared,
    required ProviderFile providerFile,
    required void Function(Object error) onError,
    required PreviewMode mode,
    required Widget fallback,
  }) {
    switch (mode) {
      case PreviewMode.thumbnail:
        return Image(
          fit: BoxFit.contain,
          image: prepared,
          errorBuilder: (context, error, stackTrace) {
            onError(error);
            return fallback;
          },
        );
      case PreviewMode.preview:
        return PhotoView(
          imageProvider: prepared,
          errorBuilder: (context, error, stackTrace) {
            onError(error);
            return fallback;
          },
        );
    }
  }
}
