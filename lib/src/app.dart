// Openapi Generator last run: : 2025-04-02T10:31:04.358222
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/common/theme/theme_controller.dart';
import 'package:consent_management_app/src/features/authentication/auth_event.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:consent_management_app/src/utils/logger/logger.dart';
import 'package:consent_management_app/src/features/local_authentication/local_auth_controller.dart';
import 'package:consent_management_app/src/features/local_authentication/local_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

class DeviceLockWrapper extends StatefulWidget {
  DeviceLockWrapper({
    required this.child,
    super.key,
  });

  final Widget? child;

  final LocalAuthController _localAuthController = LocalAuthController();
  final LocalAuthService _localAuthService = Get.find<LocalAuthService>();
  final _authService = Get.find<AuthService<String>>();

  @override
  State<DeviceLockWrapper> createState() => _DeviceLockWrapperState();
}

class _DeviceLockWrapperState extends State<DeviceLockWrapper>
    with WidgetsBindingObserver, AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child ?? Container();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /// Prevents an endless authentication loop when unlocking the device.
  /// Ensures biometric auth isn't re-triggered unnecessarily.
  bool _isUserValid = false;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (!widget._localAuthService.isReturningFromWebView && !_isUserValid) {
        await _requireLocalAuthentication();
      }
    }

    if (state == AppLifecycleState.paused) {
      _isUserValid = false;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _requireLocalAuthentication();
  }

  Future<void> _requireLocalAuthentication() async {
    final localizedReason = context.l10n.verifyIdentity;
    if (!(await widget._authService.isAuthenticated())) return;
    _isUserValid = await widget._localAuthController
        .isUserIdentityValid(localizedReason: localizedReason);
    if (!_isUserValid) {
      widget._authService.logout();
    }
  }
}

@Openapi(
  additionalProperties:
      DioProperties(pubName: 'dwa_backend_api', pubAuthor: 'Health-X dataLOFT'),
  // inputSpecFile: 'dwa_backend_api.yml',
  inputSpec: InputSpec(path: 'dwa_backend_api.yml'),
  generatorName: Generator.dio,
  outputDirectory: 'api/dwa_backend_api',
  typeMappings: {'ProviderFile': 'ApiProviderFile'},
)
class ConsentManagementApp extends StatefulWidget {
  ConsentManagementApp({
    super.key,
    this.locale,
    this.builder,
  });

  final AppRouter _appRouter = Get.find<AppRouter>();

  final Locale? locale;
  final TransitionBuilder? builder;

  @override
  ConsentManagementAppState createState() => ConsentManagementAppState();
}

class ConsentManagementAppState extends State<ConsentManagementApp> {
  final authService = Get.find<AuthService<String>>();
  late final StreamSubscription<AuthEvent> authEventsSubscription;

  @override
  void initState() {
    super.initState();
    authEventsSubscription = authService.events.listen(listener);
  }

  void listener(AuthEvent event) {
    logger.i("  Event $event");
    if (event == AuthEvent.logout) {
      // Trigger login by navigating, which runs the AutoRouteGuard
      // reevaluation. Using reevaluateListenable doesn't work due to a known
      // issue. https://github.com/Milad-Akarie/auto_route_library/issues/1993
      widget._appRouter.replaceAll([MenuViewRoute()]);
    }
  }

  @override
  void dispose() {
    authEventsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(Localizations.localeOf(context).toString());
    // Glue the SettingsService to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsService for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: widget.locale,
      builder: widget.builder,
      home: Obx(
        () => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: widget._appRouter.config(),

          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          themeMode: Get.find<ThemeController>().theme.value,
          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) => context.l10n.appTitle,
          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('de', ''), // English, no country code
          ],

          builder: (context, child) => DeviceLockWrapper(child: child),

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsService to display the correct theme.
          theme: lightTheme,
          darkTheme: darkTheme,
        ),
      ),
    );
  }
}
