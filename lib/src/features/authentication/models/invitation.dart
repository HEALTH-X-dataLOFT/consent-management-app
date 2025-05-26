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

import 'package:consent_management_app/src/features/authentication/models/id_card.dart';

class Invitation {
  String username;
  String password;
  String firstname;
  String lastname;
  String birthdate;

  Invitation({
    required this.username,
    required this.password,
    required this.birthdate,
    required this.firstname,
    required this.lastname,
  });

  Invitation.fromMap(Map<String, dynamic> json)
      : username = json["u"] as String,
        password = json["p"] as String,
        birthdate = json["b"] as String,
        firstname = json["f"] as String,
        lastname = json["l"] as String;

  Map<String, dynamic> toMap() => {
        'u': username,
        'p': password,
        'b': birthdate,
        'f': firstname,
        'l': lastname,
      };

  bool matchesIdCard(IdCard c) {
    if (firstname == c.firstname &&
        lastname == c.lastname &&
        birthdate == c.birthdate) {
      return true;
    }

    return false;
  }
}
