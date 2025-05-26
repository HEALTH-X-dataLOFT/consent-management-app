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
import 'dart:io';

import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/routing/authguard.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AwaService {
  final SettingsService _settings = Get.find<SettingsService>();
  static final AwaService _instance = AwaService._internal();
  static const _platform = MethodChannel('org.awa_plugin/idScan');
  static MethodChannel get platform => _platform;

  factory AwaService() {
    return _instance;
  }

  AwaService._internal();

  Future<void> sendPin(String pin) async {
    try {
      await _platform.invokeMethod('sendPin', pin);
    } on PlatformException catch (e) {
      logger.d("Failed to send PIN: ${e.message}");
    }
  }

  Future<void> sendKvnr(String kvnr) async {
    try {
      await _platform.invokeMethod('sendKvnr', kvnr);
    } on PlatformException catch (e) {
      logger.d("Failed to send KVNR: ${e.message}");
    }
  }

  Future<void> sendOnboarderUrl(String onboarderUrl) async {
    try {
      await _platform.invokeMethod('sendOnboarderUrl', onboarderUrl);
    } on PlatformException catch (e) {
      logger.d("Failed to send onboarderUrl: ${e.message}");
    }
  }

  Future<void> setMethodCallHandler(
    Future<dynamic> Function(MethodCall call) handler,
  ) async {
    _platform.setMethodCallHandler(handler);
  }

  Future<String> startIdScan() async {
    String idScanResult;
    try {
      final String result = await _platform.invokeMethod('startIdScan');
      idScanResult = result;
    } on PlatformException catch (e) {
      idScanResult = "Failed to start scan: '${e.message}'.";
    }

    return idScanResult;
  }

  Future<Uint8List> loadCertificate() async {
    final data = await rootBundle.load(_settings.certificatePath);
    return data.buffer.asUint8List();
  }

  Future<Uint8List> loadPrivateKey() async {
    final data = await rootBundle.load(_settings.keyPath);
    return data.buffer.asUint8List();
  }

  Future<HttpClient> createHttpClient() async {
    final context = SecurityContext(withTrustedRoots: false);

    final certificateData = await rootBundle.load(_settings.certificatePath);
    final keyData = await rootBundle.load(_settings.keyPath);

    context.useCertificateChainBytes(certificateData.buffer.asUint8List());
    context.usePrivateKeyBytes(keyData.buffer.asUint8List());

    final client = HttpClient(context: context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    return client;
  }

  Future<String> setId() async {
    String idResult;
    try {
      final String result = await _platform.invokeMethod('setId');
      idResult = result;
    } on PlatformException catch (e) {
      idResult = "Failed to start scan: '${e.message}'.";
    }

    return idResult;
  }

  Future<String> setUrl() async {
    String urlResult;
    try {
      final String result = await _platform.invokeMethod('setUrl');
      urlResult = result;
    } on PlatformException catch (e) {
      urlResult = "Failed to start scan: '${e.message}'.";
    }

    return urlResult;
  }

  Future<String> setPersonalData() async {
    String personalDataResult;
    try {
      final String result = await _platform.invokeMethod('setPersonalData');
      personalDataResult = result;
    } on PlatformException catch (e) {
      personalDataResult = "Failed to get Personal Data: '${e.message}'.";
    }

    return personalDataResult;
  }

  // generates the rootVC
  Future<String> startProof() async {
    final client = await createHttpClient();
    final request = await client.postUrl(Uri.parse(_settings.endpointProof));

    final String currentId = await setId();

    request.headers.set('Passphrase', currentId);
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');

    final String personalData = await setPersonalData();
    final Map<String, dynamic> jsonBody = json.decode(personalData);

    final String jsonString = json.encode(jsonBody);

    request.write(jsonString);

    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();

    return responseBody;
  }

  // generates the OTT
  Future<String> generateOTT(
    String providerVc,
    String rootVc,
    String passphrase,
    String apiEndPoint,
  ) async {
    final String jsonFile =
        await rootBundle.loadString(_settings.requestBodyPath);

    final Map<String, dynamic> jsonBody = json.decode(jsonFile);

    if (jsonBody.containsKey('verifiableCredential') &&
        jsonBody['verifiableCredential'] is List) {
      final List<dynamic> verifiableCredentials =
          jsonBody['verifiableCredential'];

      if (verifiableCredentials.isNotEmpty) {
        verifiableCredentials[0] = json.decode(rootVc);
      }

      if (verifiableCredentials.isNotEmpty) {
        verifiableCredentials[1] = json.decode(providerVc);
      }

      if (verifiableCredentials.length > 2 &&
          verifiableCredentials[2].containsKey('credentialSubject')) {
        final Map<String, dynamic> credentialSubject =
            verifiableCredentials[2]['credentialSubject'];

        if (credentialSubject.containsKey('passphrase')) {
          credentialSubject['passphrase'] = passphrase;
        }
      }
    }

    final client = await createHttpClient();
    final request = await client.postUrl(Uri.parse(_settings.endpointOTT));

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.write(json.encode(jsonBody));

    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();

    return responseBody;
  }
}
