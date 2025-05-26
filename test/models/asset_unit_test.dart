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

import 'package:consent_management_app/src/common/data/database_service.dart';
import 'package:consent_management_app/src/common/data/secure_file_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockDatabaseService extends GetxService
    with Mock
    implements DatabaseService {
  @override
  Future<DatabaseService> init() async {
    return this;
  }
}

class MockSecureFileStorageService extends GetxService
    with Mock
    implements SecureFileStorageService {
  @override
  SecureFileStorageService init() {
    return this;
  }
}

void main() {
  setUpAll(() async {
    await Get.putAsync<DatabaseService>(() => MockDatabaseService().init());
    Get.put<SecureFileStorageService>(MockSecureFileStorageService()..init());
  });

  tearDownAll(() async {
    Get.reset();
  });
}
