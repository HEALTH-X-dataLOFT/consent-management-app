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

class IdCard {
  String firstname;
  String lastname;
  String birthdate;

  IdCard({
    required this.birthdate,
    required this.firstname,
    required this.lastname,
  });

  IdCard.fromMap(Map<String, dynamic> json)
      : birthdate = json["birthdate"] as String,
        firstname = json["firstname"] as String,
        lastname = json["lastname"] as String;

  Map<String, dynamic> toMap() =>
      {'birthdate': birthdate, 'firstname': firstname, 'lastname': lastname};
}
