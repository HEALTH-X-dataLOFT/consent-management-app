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

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:consent_management_app/src/common/data/connectivity_service.dart';
import 'package:consent_management_app/src/common/data/database_service.dart';
import 'package:consent_management_app/src/common/data/secure_file_storage_service.dart';
import 'package:consent_management_app/src/common/data/secure_storage_service.dart';
import 'package:consent_management_app/src/common/theme/theme_controller.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/local_authentication/local_auth_service.dart';
import 'package:consent_management_app/src/features/authentication/flow/auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/flow/id_service_auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/flow/nfc_basic_auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/flow/oidc_web_auth_flow_controller.dart';
import 'package:consent_management_app/src/features/authentication/oidc/oidc_web_auth_service.dart';
import 'package:consent_management_app/src/features/authentication/oidc/simple_oidc_auth_service.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart'
    hide logger;
import 'package:consent_management_app/src/features/documents/data/provider_file_service.dart';
import 'package:consent_management_app/src/features/onboarding/onboard_service.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/routing/authguard.dart';
import 'package:consent_management_app/src/routing/router.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';

/// [AppBindings] consolidates all getX bindings that are necessary for dependency management.
class AppBindings implements Bindings {
  /// Binds all dependencies needed for the app.
  /// [dependencies] should be called in [main] as (Get.putAsync()) cannot be resolved in `GetMaterialApp`s initialBindings.
  /// see also https://github.com/jonataslaw/getx/issues/2946 and https://github.com/jonataslaw/getx/issues/1509.
  @override
  Future<void> dependencies() async {
    await GetStorage.init();

    // Register independent services first
    Get.put(ThemeController());

    Get.lazyPut(Connectivity.new);

    Get.put(ConnectivityService());
    Get.put(LocalAuthService());

    final settingsService = SettingsService()..init();
    Get.put(settingsService);

    final secureStorageService = SecureStorageService();

    Get.put(secureStorageService);

    Get.put(SecureFileStorageService()..init());
    await Get.putAsync(() => DatabaseService().init());

    await Get.putAsync(() => OnboardingService().init());

    // Register auth dependencies
    switch (settingsService.authenticationType) {
      case AuthenticationType.webkeycloak:
        await registerOidcWeb();
      case AuthenticationType.postkeycloak:
        await registerPostKeycloak();
      case AuthenticationType.idservice:
        await registerIdService();
    }

    // Register auth dependent services last
    await Get.putAsync(() => BackendService().init());
    Get.lazyPut(ProviderFileService.new);
  }

  Future<void> registerOidcWeb() async {
    final oidcUserManager = createOidcManager();
    try {
      await oidcUserManager.init();
    } catch (e) {
      logger.e("Error during creating OidcManager: $e");
    }
    Get.put<OidcUserManager>(oidcUserManager);

    final OidcWebAuthService oidcAuthService = OidcWebAuthService();
    Get.put<AuthService<String>>(oidcAuthService);

    final AuthGuard authGuard = AuthGuard.create(authService: oidcAuthService);
    final AppRouter appRouter = AppRouter(authGuard: authGuard);

    final OidcWebAuthFlowController oidcWebAuthFlowController =
        OidcWebAuthFlowController(router: appRouter);

    authGuard.init(oidcWebAuthFlowController);

    Get.put(appRouter);
    Get.put<AuthFlowController>(oidcWebAuthFlowController);
  }

  Future<void> registerIdService() async {
    final oidcUserManager = createOidcManager();
    try {
      await oidcUserManager.init();
    } catch (e) {
      logger.e("Error during creating OidcManager: $e");
    }
    Get.put<OidcUserManager>(oidcUserManager);

    final SimpleOidcAuthService simpleOidcAuthService = SimpleOidcAuthService();
    Get.put<AuthService<String>>(simpleOidcAuthService);

    final AuthGuard authGuard =
        AuthGuard.create(authService: simpleOidcAuthService);
    final AppRouter appRouter = AppRouter(authGuard: authGuard);

    final IdServiceAuthFlowController idServiceAuthFlowController =
        IdServiceAuthFlowController(router: appRouter);

    authGuard.init(idServiceAuthFlowController);

    Get.put(appRouter);
    Get.put<AuthFlowController>(idServiceAuthFlowController);
  }

  Future<void> registerPostKeycloak() async {
    final oidcUserManager = createOidcManager();
    try {
      await oidcUserManager.init();
    } catch (e) {
      logger.e("Error during creating OidcManager: $e");
    }
    Get.put<OidcUserManager>(oidcUserManager);

    final SimpleOidcAuthService simpleOidcAuthService = SimpleOidcAuthService();
    Get.put<AuthService<String>>(simpleOidcAuthService);

    final AuthGuard authGuard =
        AuthGuard.create(authService: simpleOidcAuthService);

    final AppRouter appRouter = AppRouter(authGuard: authGuard);

    final NfcBasicAuthFlowController nfcBasicAuthFlowController =
        NfcBasicAuthFlowController(router: appRouter);

    authGuard.init(nfcBasicAuthFlowController);

    Get.put(appRouter);
    Get.put<AuthFlowController>(nfcBasicAuthFlowController);
  }

  OidcUserManager createOidcManager() {
    final settingsService = Get.find<SettingsService>();
    final secureStorageService = Get.find<SecureStorageService>();
    return OidcUserManager.lazy(
      discoveryDocumentUri: OidcUtils.getOpenIdConfigWellKnownUri(
        Uri.parse(settingsService.oidcIssuer),
      ),
      clientCredentials: OidcClientAuthentication.none(
        clientId: settingsService.oidcClient,
      ),
      store: OidcDefaultStore(
        secureStorageInstance: secureStorageService.secureStorage,
      ),
      settings: OidcUserManagerSettings(
        redirectUri: Uri.parse('org.healthx.app:/oauth2redirect'),
        postLogoutRedirectUri: Uri.parse('org.healthx.app:/oauth2redirect'),
      ),
    );
  }
}
