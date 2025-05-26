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

import 'package:auto_route/annotations.dart';
import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/features/documents/preview/bloc/preview_bloc.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/default_providers.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/preview_provider.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/preview_content.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/preview_header.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/preview_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "InAppViewerViewRoute")
class InAppViewerView extends StatelessWidget {
  const InAppViewerView({
    required this.providerFile,
    super.key,
  });

  final ProviderFile providerFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreviewBloc.initial(
        providerFile: providerFile,
        providers: defaultProviders,
        mode: PreviewMode.preview,
      ),
      child: const Scaffold(
        appBar: CustomAppBar(
          showMenu: false,
          downloadCredentials: null,
          actions: [
            PreviewMenu(),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PreviewHeader(),
              PreviewContent(),
            ],
          ),
        ),
      ),
    );
  }
}
