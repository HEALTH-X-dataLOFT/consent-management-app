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

import 'package:cross_file/cross_file.dart';
import 'package:consent_management_app/src/common/data/secure_file_storage_service.dart';
import 'package:consent_management_app/src/common/models/provider_file_download.dart';
import 'package:consent_management_app/src/features/documents/preview/sniff_content_type.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:get/get.dart';

class ProviderFile {
  String id;
  String? name;
  String? description;
  int createdAt;
  String? mimeType;
  int? size;
  String provider;
  ProviderFileDownload? download;

  static final _s = Get.find<SecureFileStorageService>();

  ProviderFile({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.mimeType,
    required this.description,
    required this.provider,
    required this.size,
    this.download,
  });

  ProviderFile._apiProviderFile(
    ApiProviderFile apiProviderFile,
    String? mimeType,
    ProviderFileDownload? download,
  ) : this(
          id: apiProviderFile.id!,
          size: apiProviderFile.size,
          name: apiProviderFile.name,
          createdAt: apiProviderFile.createdAt!,
          mimeType: mimeType,
          description: apiProviderFile.description,
          provider: apiProviderFile.provider!.id!,
          download: download,
        );

  ProviderFile copyWith({
    String? id,
    String? name,
    String? description,
    int? createdAt,
    String? mimeType,
    int? size,
    String? provider,
    ProviderFileDownload? download,
  }) {
    return ProviderFile(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      mimeType: mimeType ?? this.mimeType,
      description: description ?? this.description,
      provider: provider ?? this.provider,
      size: size ?? this.size,
      download: download ?? this.download,
    );
  }

  static Future<List<ProviderFile>> fromApiProviderFileList(
    List<ApiProviderFile> list,
  ) async {
    final keys = await _s.getAllKeys();
    final List<ProviderFile> result = [];

    for (final apiProviderFile in list) {
      ProviderFileDownload? download;
      String? mimeType = apiProviderFile.mimeType;
      if (keys.contains(apiProviderFile.id)) {
        if (mimeType == null || mimeType.trim() == "") {
          final file = await _s.read(apiProviderFile.id!);
          final data = file?.value;
          if (data != null) {
            mimeType = sniffContentType(data);
          }
        }

        download = ProviderFileDownload(
          id: apiProviderFile.id!,
          name: apiProviderFile.name ?? "",
          contentType: mimeType,
        );
      } else {
        download = null;
      }
      result.add(
        ProviderFile._apiProviderFile(
          apiProviderFile,
          mimeType,
          download,
        ),
      );
    }

    return result;
  }

  static Future<ProviderFile> fromApiProviderFile(
    ApiProviderFile apiProviderFile,
  ) async {
    ProviderFileDownload? download;
    String? mimeType = apiProviderFile.mimeType;
    if (await _s.containsKey(apiProviderFile.id!)) {
      if (mimeType == null || mimeType.trim() == "") {
        final file = await _s.read(apiProviderFile.id!);
        final data = file?.value;
        if (data != null) {
          mimeType = sniffContentType(data);
        }
      }

      download = ProviderFileDownload(
        id: apiProviderFile.id!,
        name: apiProviderFile.name ?? "",
        contentType: mimeType,
      );
    } else {
      download = null;
    }
    return ProviderFile._apiProviderFile(
      apiProviderFile,
      mimeType,
      download,
    );
  }

  ProviderFile.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        createdAt = res["created_at"],
        mimeType = res["mime_type"],
        description = res["description"],
        provider = res["provider"],
        size = res["size"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'mime_type': mimeType,
      'provider': provider,
      'description': description,
      'size': size,
    };
  }

  Future<XFile?> getXFile() async {
    final assetData = await _s.read(provider);
    if (assetData == null) return null;
    return XFile.fromData(assetData.value, name: name, mimeType: mimeType);
  }

  @override
  String toString() {
    return 'ProviderFile{id: $id, name: $name, description: $description, createdAt: $createdAt, mimeType: $mimeType, size: $size, provider: $provider, download: $download}';
  }
}
