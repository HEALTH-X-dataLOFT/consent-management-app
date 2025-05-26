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

class AuthenticationData {
  static const storageKey = "authentication-data";

  String accessToken;
  int expiresIn;
  int refreshExpiresIn;
  String refreshToken;
  String tokenType;
  int notBeforePolicy;
  String sessionState;
  String scope;

  // Backwards compatibility
  String token = "";

  AuthenticationData({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.notBeforePolicy,
    required this.sessionState,
    required this.scope,
  }) {
    token = accessToken;
  }

  AuthenticationData.fromJson(Map<String, dynamic> json)
      : accessToken = json["access_token"] as String,
        expiresIn = json["expires_in"] as int,
        refreshExpiresIn = json["refresh_expires_in"] as int,
        refreshToken = json["refresh_token"] as String,
        tokenType = json["token_type"] as String,
        notBeforePolicy = json["not-before-policy"] as int,
        sessionState = json["session_state"] as String,
        scope = json["scope"] as String,
        token = json["access_token"] as String;

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        'expires_in': expiresIn,
        'refresh_expires_in': refreshExpiresIn,
        'refresh_token': refreshToken,
        'token_type': tokenType,
        'not-before-policy': notBeforePolicy,
        'session_state': sessionState,
        'scope': scope,
      };
}
