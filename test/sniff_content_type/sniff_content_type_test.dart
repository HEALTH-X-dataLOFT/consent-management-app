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

import 'dart:io';

import 'package:consent_management_app/src/features/documents/preview/sniff_content_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sniff files', () {
    final Map<String, String> expected = {
      "demo_jpeg.jpg": "image/jpeg",
      "demo_png.png": "image/png",
      "demo_tiff.tiff": "image/tiff",
      "demo_webp.webp": "image/webp",
      "demo_pdf.pdf": "application/pdf",
    };

    for (final entry in expected.entries) {
      test('should sniff ${entry.key} to be of type ${entry.value}', () async {
        final path = "test/sniff_content_type/resources/${entry.key}";
        final file = File(path);
        final content = await file.readAsBytes();

        expect(sniffContentType(content), entry.value);
      });
    }
  });
}
