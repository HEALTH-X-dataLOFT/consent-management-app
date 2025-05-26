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

import 'package:consent_management_app/src/common/models/storage_file.dart';
import 'package:flutter_secure_file_storage/flutter_secure_file_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureFileStorageService extends GetxService {
  late final FlutterSecureFileStorage _storage;

  void init() {
    _storage = FlutterSecureFileStorage(
      const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      ),
    );
  }

  Future<void> write(StorageFile item) async {
    await _storage.write(key: item.key, value: item.value);
  }

  Future<StorageFile?> read(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return StorageFile(key, value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> writeAll(List<StorageFile> items) async {
    for (final item in items) {
      await write(item);
    }
  }

  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  Future<Set<String>> getAllKeys() async {
    return await _storage.getAllKeys();
  }
}
