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
import 'dart:typed_data';

import 'package:consent_management_app/src/common/data/secure_file_storage_service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ProviderFileDownload {
  String id;
  String? name;
  String? contentType;

  ProviderFileDownload({
    required this.id,
    required this.name,
    required this.contentType,
  });

  static final _s = Get.find<SecureFileStorageService>();
  ProviderFileDownload copyWith({
    String? id,
    String? name,
    String? contentType,
  }) {
    return ProviderFileDownload(
      id: id ?? this.id,
      name: name ?? this.name,
      contentType: contentType ?? this.contentType,
    );
  }

  Future<String?> getTmpFilePath() async {
    final assetData = await _s.read(id);
    if (assetData == null) return null;
    final tmpDir = await getTemporaryDirectory();
    final path = "${tmpDir.path}/$name";
    File(path).writeAsBytes(assetData.value);
    return path;
  }

  Future<Uint8List> getData() async {
    final assetData = await _s.read(id);
    //logger.d("Got asset data: $assetData.value");
    return assetData!.value;
  }
}
