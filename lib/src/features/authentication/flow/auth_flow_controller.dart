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

import 'package:auto_route/auto_route.dart';
import 'package:consent_management_app/src/features/authentication/errors/exception.dart';
import 'package:flutter/foundation.dart';

enum AuthFlowState { processing, complete }

class AuthenticationFlowAlreadyStartedException
    extends AuthenticationException {
  const AuthenticationFlowAlreadyStartedException({
    super.extra = const {},
    super.causingException,
    super.causingStackTrace,
  }) : super("Authentication flow already started");
}

abstract class AuthFlowController {
  AuthFlowController({required this.router});

  @protected
  final StackRouter router;

  @protected
  bool authFlowStarted = false;

  VoidCallback? onComplete;

  void startAuthFlow({required VoidCallback onComplete}) {
    if (authFlowStarted) {
      throw const AuthenticationFlowAlreadyStartedException();
    }
    this.onComplete = onComplete;
  }

  void onAuthenticationComplete() {
    onComplete!();
    authFlowStarted = false;
    onComplete = null;
  }
}
