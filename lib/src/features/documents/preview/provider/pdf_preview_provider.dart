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
import 'package:pdfrx/pdfrx.dart';

class PdfPreviewProvider extends PreviewProvider<PdfDocumentRef> {
  @override
  bool canHandle({
    required String mimeType,
    required Uint8List data,
    required ProviderFile providerFile,
    required PreviewMode mode,
  }) =>
      mimeType == "application/pdf";

  @override
  Future<PdfDocumentRef> prepare(
    Uint8List data, {
    required ProviderFile providerFile,
    required PreviewMode mode,
  }) async =>
      PdfDocumentRefData(data, sourceName: providerFile.name ?? '');

  @override
  Widget build({
    required BuildContext context,
    required PdfDocumentRef prepared,
    required ProviderFile providerFile,
    required void Function(Object error) onError,
    required PreviewMode mode,
    required Widget fallback,
  }) {
    switch (mode) {
      case PreviewMode.thumbnail:
        return PdfDocumentViewBuilder(
          documentRef: prepared,
          builder: (context, document) {
            return PdfPageView(
              document: document,
              pageNumber: 1,
              decoration: const BoxDecoration(color: Colors.transparent),
            );
          },
        );
      case PreviewMode.preview:
        return PdfViewer(prepared);
    }
  }
}
