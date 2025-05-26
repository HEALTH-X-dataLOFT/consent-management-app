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

/// Two hex chars representing a byte, separated by spaces.
/// "??" represents any byte.
/// Taken from https://en.wikipedia.org/wiki/List_of_file_signatures
Map<List<int?>, String> _magicBytes = {
  "FF D8 FF DB": "image/jpeg",
  "FF D8 FF E0 00 10 4A 46 49 46 00 01": "image/jpeg",
  "FF D8 FF EE": "image/jpeg",
  "FF D8 FF E1 ?? ?? 45 78 69 66 00 00": "image/jpeg",
  "00 00 00 0C 6A 50 20 20 0D 0A 87 0A": "image/jp2",
  "FF 4F FF 51": "image/jp2",
  "50 4B 03 04": "application/zip",
  "50 4B 05 06": "application/zip",
  "50 4B 07 08": "application/zip",
  "89 50 4E 47 0D 0A 1A 0A": "image/png",
  "25 50 44 46 2D": "application/pdf",
  "30 26 B2 75 8E 66 CF 11 A6 D9 00 AA 00 62 CE 6C": "application/vnd.ms-asf",
  // Multiple mime types exist, like "audio/ogg".
  "4F 67 67 53": "video/ogg",
  "52 49 46 46 ?? ?? ?? ?? 57 41 56 45": "audio/vnd.wave",
  "52 49 46 46 ?? ?? ?? ?? 41 56 49 20": "video/vnd.avi",
  "FF FB": "audio/mpeg",
  "FF F3": "audio/mpeg",
  "FF F2": "audio/mpeg",
  "49 44 33": "audio/mpeg",
  "42 4D": "image/bmp",
  "66 4C 61 43": "audio/flac",
  "37 7A BC AF 27 1C": "application/x-7z-compressed",
  "1F 8B": "application/gzip",
  "FD 37 7A 58 5A 00": "application/x-xz",
  "3C 3F 78 6D 6C 20": "application/xml",
  "3C 00 3F 00 78 00 6D 00 6C 00 20": "application/xml",
  "00 3C 00 3F 00 78 00 6D 00 6C 00 20": "application/xml",
  "3C 00 00 00 3F 00 00 00 78 00 00 00 6D 00 00 00 6C 00 00 00 20 00 00 00":
      "application/xml",
  "00 00 00 3C 00 00 00 3F 00 00 00 78 00 00 00 6D 00 00 00 6C 00 00 00 20":
      "application/xml",
  "4C 6F A7 94 93 40": "application/xml",
  "52 49 46 46 ?? ?? ?? ?? 57 45 42 50": "image/webp",
  "66 74 79 70 69 73 6F 6D": "video/mp4",
  "66 74 79 70 4D 53 4E 56": "video/mp4",
  "49 49 2A 00": "image/tiff",
  "4D 4D 00 2A": "image/tiff",
  "49 49 2B 00": "image/tiff",
  "4D 4D 00 2B": "image/tiff",
  "47 49 46 38 37 61": "image/gif",
  "47 49 46 38 39 61": "image/gif",
}.map(
  (key, value) => MapEntry(
    key.split(" ").map((value) {
      if (value == "??") return null;
      return int.parse(value, radix: 16);
    }).toList(),
    value,
  ),
);

/// Try to determine the content type with magic bytes.
/// Returns null, if there was no match.
String? sniffContentType(Uint8List data) {
  entries:
  for (final entry in _magicBytes.entries) {
    // Magic bytes are longer than the file in question, so can't match.
    if (entry.key.length > data.lengthInBytes) {
      continue;
    }

    bytes:
    // It's safe to go by entry.key.length, because we checked its larger or
    // equal to data.lengthInBytes.
    for (int i = 0; i < entry.key.length; i++) {
      final comparatorByte = entry.key[i];

      // Null represents a wildcard byte.
      if (comparatorByte == null) {
        continue bytes;
      }

      // Byte doesn't match so move on to the next magic byte entry.
      if (comparatorByte != data[i]) {
        continue entries;
      }
    }

    // We matched all bytes in the magic byte entry so we found the type.
    return entry.value;
  }

  // None of the entries matched, so we don't know the type.
  return null;
}
