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

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

@RoutePage()
class ProviderListView extends StatefulWidget {
  const ProviderListView({required this.loadFilesFromProvider, super.key});

  final bool loadFilesFromProvider;

  @override
  State<ProviderListView> createState() => _ProviderListViewState();
}

class _ProviderListViewState extends State<ProviderListView>
    with AfterLayoutMixin<ProviderListView> {
  final backendService = Get.find<BackendService>();
  final settingsService = Get.find<SettingsService>();
  late List<Provider> providerList;
  late bool isLoading;
  late bool hasError;
  late bool hideUI;
  static const String chariteProvider = "Charité";

  @override
  void initState() {
    super.initState();
    providerList = [];
    isLoading = true;
    hasError = false;
    hideUI = settingsService.studyMode;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      final providers = await backendService.backendApi
          .apiProvidersGet()
          .then<List<Provider>>((response) {
        logger.d("Got providers: $response");
        return response.data?.asList() ?? [];
      });

      if (settingsService.studyMode) {
        final Provider charite = providers.lastWhere(
          (Provider p) => p.name!.contains(chariteProvider),
        );
        navigateToDocumentsListView(charite);
        /*else {
          navigateToDownloadedDocumentsListView(charite.name ?? "");
        }*/
      } else {
        setState(() {
          hideUI = false;
          providerList.addAll(providers);
          isLoading = false;
        });
      }
    } catch (error) {
      logger.d("Got error while getting providers: $error");
      showErrorMessage();
      setState(() {
        hideUI = false;
        hasError = true;
        isLoading = false;
      });
    }
  }

  void showErrorMessage() {
    Fluttertoast.showToast(
      msg: context.l10n.getProviderListError,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  void navigateToDocumentsListView(Provider provider) {
    context.router.replace(
      DocumentsListViewRoute(
        provider: provider,
      ),
    );
  }

  void navigateToDownloadedDocumentsListView(Provider provider) {
    context.router
        .replace(DownloadedDocumentsListViewRoute(provider: provider));
  }

  @override
  Widget build(BuildContext context) {
    if (hideUI) {
      return const Scaffold();
    }
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.builder(
        itemCount: providerList.length,
        itemBuilder: (context, index) {
          final Provider provider = providerList[index];
          return ListTile(
            title: Row(
              children: [
                const Icon(
                  Icons.circle,
                  size: 10.0,
                ),
                const SizedBox(width: 10.0),
                Text(
                  provider.name ?? context.l10n.no_provider_name_placeholder,
                  style: context.textTheme.titleSmall,
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: widget.loadFilesFromProvider == false
                ? () => navigateToDownloadedDocumentsListView(provider)
                : provider.providerUrl != null && provider.name != null
                    ? () => navigateToDocumentsListView(provider)
                    : null,
          );
        },
      ),
    );
  }
}
