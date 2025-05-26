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

import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/features/authentication/nfc/widgets/phone_qr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(() async* {
    final montserratLicense =
        await rootBundle.loadString('assets/google_fonts/OFL.txt');
    final robotoLicense =
        await rootBundle.loadString('assets/google_fonts/Apache2.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], montserratLicense);
    yield LicenseEntryWithLineBreaks(['google_fonts'], robotoLicense);
  });

  runApp(
    MaterialApp(
      home: const Scaffold(
        body: SafeArea(
          child: DebugHomeView(),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('de', ''),
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
    ),
  );
}

class DebugHomeView extends StatelessWidget {
  const DebugHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhoneQR();
  }
}
