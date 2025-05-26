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

import 'package:consent_management_app/src/common/models/storage_item.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorageService extends GetxService {
  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  FlutterSecureStorage get secureStorage => _secureStorage;

  Future<void> write(StorageItem item) async {
    await _secureStorage.write(key: item.key, value: item.value);
  }

  Future<StorageItem?> read(String key) async {
    final value = await _secureStorage.read(key: key);
    if (value == null) return null;
    return StorageItem(key, value);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  Future<List<StorageItem>> readAll() async {
    final all = await _secureStorage.readAll();
    return all.entries
        .map((entry) => StorageItem(entry.key, entry.value))
        .toList();
  }

  Future<void> writeAll(List<StorageItem> items) async {
    for (final item in items) {
      await write(item);
    }
  }

  Future<bool> containsKey(String key) async {
    return await _secureStorage.containsKey(key: key);
  }
}
