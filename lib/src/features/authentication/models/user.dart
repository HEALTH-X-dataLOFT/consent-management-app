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

class User {
  static const storageKey = "user-login-data";

  String username;
  String password;

  User({required this.username, required this.password});

  User.fromMap(Map<String, dynamic> json)
      : username = json["username"] as String,
        password = json["password"] as String;

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
