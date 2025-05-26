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
import 'package:consent_management_app/src/common/data/database_service.dart';
import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/common/widgets/document_type_quick_filter.dart';
import 'package:consent_management_app/src/features/documents/widgets/custom_grouped_list.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

@RoutePage()
class DownloadedDocumentsListView extends StatefulWidget {
  const DownloadedDocumentsListView(this.provider, {super.key});

  final Provider provider;

  @override
  DownloadedDocumentsListViewState createState() =>
      DownloadedDocumentsListViewState();
}

class DownloadedDocumentsListViewState
    extends State<DownloadedDocumentsListView> with WidgetsBindingObserver {
  final DatabaseService _databaseService = Get.find<DatabaseService>();

  final settingsService = Get.find<SettingsService>();
  List<ProviderFile> _providerFiles = [];

  @override
  void initState() {
    _getProviderFiles();
    logger.d("Initiating state in DownloadedDocumentsList");
    super.initState();
  }

  Future<void> _getProviderFiles() async {
    final List<ProviderFile> providerFiles =
        await _databaseService.providersFiles();

    final List<ProviderFile> filteredFiles = providerFiles
        .where(
          (providerFile) =>
              //providerFile.provider!.name == widget.provider */&&
              providerFile.download != null,
        )
        .toList();

    if (filteredFiles.isEmpty) {
      navigateToNoDownloadsView();
      return;
    }

    setState(() {
      _providerFiles = filteredFiles;
    });
  }

  void navigateToNoDownloadsView() {
    context.router.replace(const NoDownloadsViewRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 9.0, top: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  context.l10n.menuDownloadsTitle,
                  style: context.textTheme.headlineMedium,
                ),
              ),
              const DocumentTypeQuickFilter(
                showSegmentTitle: false,
              ),
              Expanded(
                child: CustomGroupedList(
                  _providerFiles,
                  provider: widget.provider,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
