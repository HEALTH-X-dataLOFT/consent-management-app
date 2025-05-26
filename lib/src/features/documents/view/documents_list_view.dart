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
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/common/widgets/app_search_bar.dart';
import 'package:consent_management_app/src/common/widgets/document_type_quick_filter.dart';
import 'package:consent_management_app/src/common/widgets/show_refresh_indicator_on_first_render_wrapper.dart';
import 'package:consent_management_app/src/features/documents/data/provider_file_service.dart';
import 'package:consent_management_app/src/features/documents/widgets/custom_grouped_list.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:skeletonizer/skeletonizer.dart';

Logger logger = Logger();

enum LoadingStateType { loadingAssets, downloadingAsset, removingAsset }

enum DocumentsSelection { all, records, documents }

@RoutePage()
class DocumentsListView extends StatefulWidget {
  const DocumentsListView({
    required this.provider,
    super.key,
  });

  final Provider provider;

  @override
  DocumentsListViewState createState() => DocumentsListViewState();
}

class DocumentsListViewState extends State<DocumentsListView> {
  final _providerFileService = Get.find<ProviderFileService>();
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();
  final SettingsService settingsService = Get.find<SettingsService>();

  @override
  void initState() {
    super.initState();
  }

  void showErrorMessage() {
    Fluttertoast.showToast(
      msg: context.l10n.getProviderListError,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 22.0, left: 22.0, top: 15),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  if (!settingsService.studyMode) {
                    return const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: AppSearchBar(controller: null),
                        ),
                        SizedBox(height: 20.0),
                        DocumentTypeQuickFilter(
                          showSegmentTitle: true,
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        context.l10n.documents_selection_all_description,
                        style: context.textTheme.headlineMedium,
                      ),
                    );
                  }
                },
              ),
              Expanded(
                child: Obx(() {
                  // There's some kind of race-condition with dependency
                  // tracking, and this ensures an update to providerFiles
                  // causes a rerender of this widget builder.
                  _providerFileService.providerFiles.length;

                  if (!_providerFileService.didInitialLoad.value) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const Skeletonizer.zone(
                          child: ListTile(
                            leading: Bone.icon(),
                            title: Bone.text(words: 2),
                            trailing: Bone.icon(),
                          ),
                        );
                      },
                    );
                  }

                  return RefreshIndicator(
                    key: _refreshKey,
                    onRefresh: () async {
                      try {
                        await _providerFileService
                            .fetchFromBackend(widget.provider);
                      } catch (_) {
                        showErrorMessage();
                      }
                    },
                    child: Builder(
                      builder: (context) {
                        final list = _providerFileService.providerFiles
                            .where(
                              (providerFile) =>
                                  providerFile.provider == widget.provider.id!,
                            )
                            .toList(growable: false);

                        return ShowRefreshIndicatorOnFirstRenderWrapper(
                          refreshKey: _refreshKey,
                          child: CustomGroupedList(
                            list,
                            provider: widget.provider,
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
