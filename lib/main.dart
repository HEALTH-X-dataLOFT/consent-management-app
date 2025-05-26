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

import 'package:consent_management_app/src/app_bindings.dart';
import 'package:consent_management_app/src/utils/logger/debug_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:consent_management_app/src/app.dart';

Future<void> main() async {
  Bloc.observer = DebugBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(() async* {
    final montserratLicense =
        await rootBundle.loadString('assets/google_fonts/OFL.txt');
    final robotoLicense =
        await rootBundle.loadString('assets/google_fonts/Apache2.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], montserratLicense);
    yield LicenseEntryWithLineBreaks(['google_fonts'], robotoLicense);
  });

  await AppBindings().dependencies();

  runApp(ConsentManagementApp());
}
