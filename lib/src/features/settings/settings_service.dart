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

import 'package:get/get.dart';

enum AuthenticationType { webkeycloak, postkeycloak, idservice }

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
class SettingsService extends GetxService {
  late String _basePath;
  late String _oidcIssuer;
  late String _oidcClient;
  late AuthenticationType _authenticationType;
  late bool _studyMode;
  late String _endpointOTT;
  late String _endpointProof;
  late String _certificatePath;
  late String _keyPath;
  late String _requestBodyPath;
  late String _onboarderUrl;
  late bool _featureStudyParticipation;
  late String _featureStudyParticipationUrl;

  String get basePath => _basePath;
  String get oidcIssuer => _oidcIssuer;
  String get oidcClient => _oidcClient;
  AuthenticationType get authenticationType => _authenticationType;
  bool get featureStudyParticipation => _featureStudyParticipation;
  String get featureStudyParticipationUrl => _featureStudyParticipationUrl;
  bool get studyMode => _studyMode;
  String get endpointOTT => _endpointOTT;
  String get endpointProof => _endpointProof;
  String get certificatePath => _certificatePath;
  String get keyPath => _keyPath;
  String get requestBodyPath => _requestBodyPath;
  String get onboarderUrl => _onboarderUrl;

  void init() {
    _loadEnvironment();
  }

  void _loadEnvironment() {
    _basePath = const String.fromEnvironment(
      'BASE_PATH',
    );

    _oidcIssuer = const String.fromEnvironment(
      'OIDC_ISSUER',
    );

    _oidcClient = const String.fromEnvironment(
      'OIDC_CLIENT',
      defaultValue: 'cma-frontend',
    );

    _studyMode = const bool.fromEnvironment('STUDY_MODE', defaultValue: false);

    _authenticationType = _studyMode
        ? AuthenticationType.webkeycloak
        : AuthenticationType.values.byName(
            const String.fromEnvironment(
              'AUTHENTICATION_TYPE',
              defaultValue: "webkeycloak",
            ),
          );

    /*
    * Experimental! ID service Authentication
    * Authentication with ID using https://www.ausweisapp.bund.de/sdk/
    */
    _endpointOTT = const String.fromEnvironment(
      'ENDPOINT_OTT',
    );

    _endpointProof = const String.fromEnvironment(
      'ENDPOINT_PROOF',
    );

    _certificatePath = const String.fromEnvironment(
      'CERTIFICATE_PATH',
    );

    _keyPath = const String.fromEnvironment(
      'KEY_PATH',
    );

    _requestBodyPath = const String.fromEnvironment(
      'REQUEST_BODY_PATH',
    );

    _onboarderUrl = const String.fromEnvironment(
      'ONBOARDER_URL',
    );

    /*
    * Study participation
    * A testing feature for a dummy study participation
    * FEATURE_STUDY_PARTICIPATION_URL needs to be set as well
    */
    _featureStudyParticipation = const bool.fromEnvironment(
      'FEATURE_STUDY_PARTICIPATION',
      defaultValue: false,
    );

    _featureStudyParticipationUrl = const String.fromEnvironment(
      'FEATURE_STUDY_PARTICIPATION_URL',
    );
  }
}
