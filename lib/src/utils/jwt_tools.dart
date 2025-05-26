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

import 'package:jose_plus/jose.dart';

Future<String> encryptJWT(String publicKeyBase64, String jwt) async {
  final builder = JsonWebEncryptionBuilder();
  builder.stringContent = jwt;

  // set some protected header
  builder.setProtectedHeader("createdAt", DateTime.now().toIso8601String());

  // add a key to encrypt the Content Encryption Key
  final jwk = JsonWebKey.fromJson(
    json.decode(utf8.decode(base64Decode(publicKeyBase64))),
  );
  builder.addRecipient(jwk, algorithm: "RSA-OAEP-256");

  // set the content encryption algorithm to use
  builder.encryptionAlgorithm = "A128CBC-HS256";

  // build the jws
  final jwe = builder.build();
  return jwe.toCompactSerialization();
}

JsonWebToken parseJWT(String encodedJWT) {
  return JsonWebToken.unverified(encodedJWT);
}

Map<String, dynamic> parseJWTClaims(String encodedJWT) {
  return parseJWT(encodedJWT).claims.toJson();
}
