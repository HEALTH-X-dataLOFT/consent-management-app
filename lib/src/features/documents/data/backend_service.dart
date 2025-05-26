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

import 'dart:convert';

import 'package:consent_management_app/src/features/documents/data/http_error_interceptor.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/utils/initialization_mixin.dart';
import 'package:dio/dio.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class BackendService extends GetxService with InitializationMixin {
  final settingsService = Get.find<SettingsService>();
  DefaultApi? _defaultApi;

  Future<BackendService> init() async {
    logger.i("Initializing backend service");
    if (hasInit) {
      logger.i("backend service already initializing");
      return this;
    }

    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: settingsService.basePath,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 120000),
        ),
      );
      dio.interceptors.add(HttpErrorInterceptor());

      final dwaBackendApi = DwaBackendApi(
        dio: dio,
        basePathOverride: settingsService.basePath,
      );

      _defaultApi = dwaBackendApi.getDefaultApi();

      markAsInitlized();
      logger.i("backend service initialized");
    } catch (error, stacktrace) {
      logger.e("Error during initialisation: $error");
      logger.d(stacktrace);
      rethrow;
    }
    return this;
  }

  DefaultApi get backendApi {
    ensureInit();
    return _defaultApi!;
  }

  Future<List<ApiProviderFile>> getApiProviderFileList(
    Provider provider,
    String? jwe,
  ) async {
    final providerFiles = await backendApi.apiProvidersProviderIdFilesGet(
      providerId: provider.id!,
      headers: {
        'Authorization': "Bearer $jwe",
      },
    ).then<List<ApiProviderFile>>((response) {
      logger.d("Got providers files: $response");
      return response.data?.asList() ?? [];
    });
    return providerFiles;
  }

  Future<bool> dummyParticipateInStudy(String studyId) async {
    if (!settingsService.featureStudyParticipation) {
      logger.d("This feature is disabled, nothing happens");
      // ignore: null_argument_to_non_null_type
      return Future.value();
    }
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: settingsService.featureStudyParticipationUrl,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 120000),
        ),
      );
      final response = await dio.post(
        "consent/create",
        data: jsonEncode(
          {
            "permission": [
              {
                "target": "example-target",
                "assigner": "example-assigner",
                "assignee": "example-assignee",
                "action": "example-action",
              }
            ],
            "sub": "126",
            "studyId": studyId,
          },
        ),
      );
      return response.statusCode == 200;
    } catch (error, stacktrace) {
      logger.e("Error participating in study $studyId: $error");
      logger.d(stacktrace);
      rethrow;
    }
  }
}
