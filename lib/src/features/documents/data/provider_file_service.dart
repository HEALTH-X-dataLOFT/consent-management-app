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

import 'package:consent_management_app/src/common/data/database_service.dart';
import 'package:consent_management_app/src/common/data/secure_file_storage_service.dart';
import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/models/provider_file_download.dart';
import 'package:consent_management_app/src/common/models/storage_file.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/features/documents/preview/sniff_content_type.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:get/get.dart';

class ProviderFileService extends GetxService {
  late final AuthService _authService = Get.find<AuthService<String>>();
  late final DatabaseService _databaseService = Get.find<DatabaseService>();
  late final BackendService _backendService = Get.find<BackendService>();
  late final SecureFileStorageService _secureFileStorageService =
      Get.find<SecureFileStorageService>();
  final RxList<ProviderFile> _providerFiles = RxList();
  final RxBool _didInitialLoad = RxBool(false);

  /// Some data is available, either via cache or remote fetch.
  RxBool get didInitialLoad => _didInitialLoad;

  Future<List<ProviderFile>> fetchFromCache() async {
    final result = await _databaseService.providersFiles();
    _providerFiles.assignAll(result);
    _didInitialLoad.value = true;
    return result;
  }

  /// Fetches the provider files from the backend and reloads the
  /// [providerFiles] observable list.
  ///
  /// The returned `List<ProviderFile>` only contains the fetched data from this
  /// provider and is not the same list that is returned by [providerFiles]
  Future<List<ProviderFile>> fetchFromBackend(Provider provider) async {
    final jwe = await _authService.buildUserCredentials(provider.publicKey!);
    final apiProviderFiles =
        await _backendService.getApiProviderFileList(provider, jwe);
    final result = await ProviderFile.fromApiProviderFileList(apiProviderFiles);

    for (final file in result) {
      await _databaseService.insertProviderFile(file);
    }
    // Since we've added the remote files we can simply reload from the db.
    // Patching needs to filter by provider, so this is easier for now.
    await fetchFromCache();

    return result;
  }

  RxList<ProviderFile> get providerFiles => _providerFiles;

  Stream<ProviderFile> changes(ProviderFile providerFile) {
    return providerFiles.stream.map(
      (list) =>
          list.firstWhereOrNull(
            (f) =>
                f.id == providerFile.id && f.provider == providerFile.provider,
          ) ??
          providerFile,
    );
  }

  Future<ProviderFile> saveDownload(
    ProviderFile providerFile,
    Uint8List data,
  ) async {
    await _secureFileStorageService.write(StorageFile(providerFile.id, data));
    final String? mimeType = providerFile.mimeType;
    final ProviderFile newProviderFile = providerFile.copyWith(
      mimeType: (mimeType == null || mimeType.trim() == "")
          ? sniffContentType(data)
          : mimeType,
      download: ProviderFileDownload(
        id: providerFile.id,
        name: providerFile.name ?? "",
        contentType: mimeType,
      ),
    );

    await _databaseService.insertProviderFile(newProviderFile);

    _providerFiles.removeWhere(
      (x) => x.id == providerFile.id && x.provider == providerFile.provider,
    );
    _providerFiles.add(newProviderFile);

    return newProviderFile;
  }

  Future<ProviderFile> deleteDownload(ProviderFile providerFile) async {
    await _secureFileStorageService.delete(providerFile.id);

    final newProviderFile = providerFile.copyWith();
    newProviderFile.download = null;

    _providerFiles.removeWhere(
      (x) => x.id == providerFile.id && x.provider == providerFile.provider,
    );
    _providerFiles.add(newProviderFile);

    return newProviderFile;
  }

  @override
  void onInit() {
    fetchFromCache();

    super.onInit();
  }
}
