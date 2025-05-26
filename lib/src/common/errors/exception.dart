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

import 'package:consent_management_app/src/utils/extensions/map.dart';
import 'package:http/http.dart' as http;

class CmaException implements Exception {
  const CmaException(
    this.message, {
    this.extra = const {},
    this.causingException,
    this.causingStackTrace,
  });

  final String message;
  final Map<String, dynamic> extra;
  final Object? causingException;
  final StackTrace? causingStackTrace;

  @override
  String toString() {
    return 'CmaException: $message'
        '${extra.isNotEmpty ? ', extra: ${extra.format()}' : ''}'
        '${causingException != null ? ', causingException: $causingException' : ''}'
        '${causingStackTrace != null ? ', causingStackTrace: $causingStackTrace' : ''}';
  }
}

class CmaHttpException extends CmaException {
  const CmaHttpException(
    super.message, {
    super.extra,
    super.causingException,
    super.causingStackTrace,
    this.request,
    this.response,
  });

  final http.Request? request;
  final http.Response? response;

  @override
  String toString() {
    return '${super.toString()}'
        '${request != null ? ', request: $request' : ''}'
        '${response != null ? ', response: $response' : ''}';
  }
}
