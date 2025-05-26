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

import 'package:consent_management_app/src/common/errors/exception.dart';

abstract class AuthenticationException extends CmaHttpException {
  const AuthenticationException(
    super.message, {
    super.extra = const {},
    super.causingException,
    super.causingStackTrace,
    super.request,
    super.response,
  });
}

class CancelAuthenticationException extends AuthenticationException {
  const CancelAuthenticationException({
    super.extra = const {},
    super.causingException,
    super.causingStackTrace,
  }) : super("User cancel authentication process");
}

class GeneralAuthenticationException extends AuthenticationException {
  const GeneralAuthenticationException({
    super.extra = const {},
    super.causingException,
    super.causingStackTrace,
  }) : super("General authentication problem occurred");
}

class NoUserAgentException extends AuthenticationException {
  const NoUserAgentException({
    super.extra = const {},
    super.causingException,
    super.causingStackTrace,
  }) : super("No user agent available");
}

class UnableToLoadDiscoveryDocument extends AuthenticationException {
  const UnableToLoadDiscoveryDocument({
    super.extra = const {},
    super.causingException,
    super.causingStackTrace,
    super.request,
    super.response,
  }) : super("Unable to get metadata of OpenID server");
}
