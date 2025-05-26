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

import 'package:consent_management_app/src/features/authentication/models/user.dart';
import 'package:consent_management_app/src/features/authentication/oidc/oidc_auth_service.dart';
import 'package:get/get.dart';
import 'package:oidc/oidc.dart';

class SimpleOidcAuthService extends GetxService with OidcAuthService {
  @override
  Future<OidcUser?> performOidcLogin() async {
    final storageItem = await secureStorage.read(User.storageKey);
    if (storageItem == null) {
      return null;
    }
    final user = User.fromMap(jsonDecode(storageItem.value));
    final oidcUser = await oidcManager.loginPassword(
      username: user.username,
      password: user.password,
    );
    return oidcUser;
  }
}
