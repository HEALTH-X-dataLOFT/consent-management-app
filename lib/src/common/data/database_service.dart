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

import 'package:consent_management_app/src/common/data/secure_file_storage_service.dart';
import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/models/provider_file_download.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/utils/initialization_mixin.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService extends GetxService with InitializationMixin {
  Database? _database;
  static final _s = Get.find<SecureFileStorageService>();

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'flutter_sqflite_database.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: 3,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<DatabaseService> init() async {
    logger.i("Initializing database service");
    if (hasInit) {
      logger.i("database service already initializing");
      return this;
    }
    try {
      _database = await _initDatabase();
      markAsInitlized();
      logger.i("database service initialized");
    } catch (error, stacktrace) {
      logger.e("Error during initialisation: $error");
      logger.d(stacktrace);
      rethrow;
    }
    return this;
  }

  Future<Database> get database async {
    ensureInit();
    return _database!;
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // We use idempotent roll-forward migrations, so upgrades run the same
    // queries as initial creation.
    await _onCreate(db, newVersion);
  }

  // Also used for upgrades.
  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute("""
      CREATE TABLE IF NOT EXISTS asset_files (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          asset_id TEXT UNIQUE NOT NULL,
          provider TEXT NOT NULL,
          name TEXT NOT NULL,
          created_at INTEGER NOT NULL,
          content_type TEXT NOT NULL,
          filename TEXT NOT NULL,
          description TEXT NOT NULL
        )
      """);
    batch.execute("""
      DROP TABLE asset_files;
   """);
    batch.execute("""
      CREATE TABLE IF NOT EXISTS provider_files (
          id INTEGER NOT NULL,
          provider TEXT NOT NULL,
          name TEXT NOT NULL,
          created_at INTEGER NOT NULL,
          mime_type TEXT NOT NULL,
          size  INTEGER NOT NULL,
          description TEXT NOT NULL,
          PRIMARY KEY (provider,id)  
       )
     """);
    await batch.commit();
  }

  Future<void> insertProviderFile(ProviderFile providerFile) async {
    await insertProviderFiles([providerFile]);
  }

  Future<void> insertProviderFiles(List<ProviderFile> providerFiles) async {
    final db = await database;
    final batch = db.batch();
    for (final providerFile in providerFiles) {
      batch.insert(
        'provider_files',
        providerFile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<List<ProviderFile>> providersFiles() async {
    final db = await database;
    final (maps, keys) =
        await (db.query('provider_files'), _s.getAllKeys()).wait;

    final providerFiles = List.generate(
      maps.length,
      (index) => ProviderFile.fromMap(maps[index]),
    );
    for (final providerFile in providerFiles) {
      if (keys.contains(providerFile.id)) {
        providerFile.download = ProviderFileDownload(
          contentType: providerFile.mimeType,
          id: providerFile.id,
          name: providerFile.name ?? "",
        );
      } else {
        providerFile.download = null;
      }
    }
    return providerFiles;
  }

  Future<void> flushAssets() async {
    final db = await database;
    await db.delete('provider_files');
  }
}
