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

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/authentication/flow/auth_flow_controller.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:consent_management_app/src/utils/initialization_mixin.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

class AuthGuard extends AutoRouteGuard with InitializationMixin {
  final AuthService authService;
  AuthFlowController? authFlowController;

  AuthGuard._({
    required this.authService,
    this.authFlowController,
  });

  factory AuthGuard.create({
    required AuthService authService,
    AuthFlowController? authFlowController,
  }) {
    return AuthGuard._(
      authService: authService,
      authFlowController: authFlowController,
    );
  }

  /// This function allows for later initialization of an AuthFlowController to prevent circular dependencies.
  /// Later use has to be check with [ensureInit] of the [InitializationMixin].
  void init(AuthFlowController? controller) {
    if (authFlowController == null && controller == null) {
      throw NotInitializedError();
    }
    authFlowController = controller ?? authFlowController;

    markAsInitlized();
  }

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    ensureInit();
    final authenticated = await authService.isAuthenticated();
    if (authenticated) {
      resolver.next(true);
    } else {
      try {
        authFlowController!.startAuthFlow(
          onComplete: () {
            router.replaceAll([MenuViewRoute()]);
          },
        );
      } on AuthenticationFlowAlreadyStartedException catch (error) {
        logger.d(error.message);
      }
    }
  }
}
