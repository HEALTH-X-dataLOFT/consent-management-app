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
import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/common/widgets/progress_icon_button.dart';
import 'package:consent_management_app/src/features/authentication/auth_service.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/features/documents/data/provider_file_service.dart';
import 'package:consent_management_app/src/features/documents/preview/widgets/thumbnail.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:dio/dio.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

enum FileState { missing, present, downloading }

@RoutePage()
// ignore: must_be_immutable
class DocumentDetailsView extends StatefulWidget {
  ProviderFile providerFile;
  Provider provider;

  DocumentDetailsView({
    required this.providerFile,
    required this.provider,
    super.key,
  });

  @override
  DocumentDetailsViewState createState() => DocumentDetailsViewState();
}

class DocumentDetailsViewState extends State<DocumentDetailsView>
    with AfterLayoutMixin<DocumentDetailsView> {
  late ProviderFile providerFile;

  late FileState state = widget.providerFile.download != null
      ? FileState.present
      : FileState.missing;
  final SettingsService settingsService = Get.find<SettingsService>();
  final AuthService<String> authService = Get.find<AuthService<String>>();
  DownloadCredentials? downloadCredentials;
  bool showMenu = false;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (providerFile.download == null) {
      download();
    }
  }

  @override
  void initState() {
    super.initState();
    providerFile = widget.providerFile;
    _loadCredentials();
    showMenu = settingsService.studyMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showMenu: showMenu,
        downloadCredentials: downloadCredentials,
        provider: widget.provider,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                      left: 22.0,
                      right: 22.0,
                    ),
                    child: Tooltip(
                      message: "${providerFile.name ?? ""} $createdAt",
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "${providerFile.name ?? ""} $createdAt",
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.colorScheme.outlineVariant,
                          width: 1.0,
                        ),
                        color: context.colorScheme.surfaceDim,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          DocumentDetailsHeader(
                            title: providerFile.name!,
                            isLoading: isLoading,
                            icon: stateIndicatorIcon,
                            onIconIdicatorPressed: onIconIdicatorPressed,
                          ),
                          const SizedBox(height: 12),
                          const Divider(height: 1),
                          Thumbnail(
                            providerFile: providerFile,
                          ),
                          const Divider(height: 1),
                          const SizedBox(height: 12),
                          Flexible(
                            child: DocumentDetailsBody(
                              buttonLabel: buttonLabel,
                              description: providerFile.description,
                              onActionPressed: onActionPressed,
                              contentType: providerFile.mimeType,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _loadCredentials() async {
    final DownloadCredentials? credentials = await getDownloadCredentials();
    setState(() {
      downloadCredentials = credentials;
    });
  }

  Future<void> delete() async {
    logger.i("Deleting file ${providerFile.name} "
        "from provider ${providerFile.provider}");
    final providerFileService = Get.find<ProviderFileService>();
    final newProviderFile =
        await providerFileService.deleteDownload(providerFile);

    setState(() {
      state = FileState.missing;
      providerFile = newProviderFile;
    });
  }

  Future<DownloadCredentials?> getDownloadCredentials() async {
    logger.i("Downloading file ${providerFile.name} "
        "from provider $providerFile");
    final backendService = Get.find<BackendService>();
    try {
      final userCredentials =
          await authService.buildUserCredentials(widget.provider.publicKey!);
      final response = await backendService.backendApi
          .apiProvidersProviderIdFilesProviderFileIdCredentialsGet(
        providerId: providerFile.provider,
        providerFileId: providerFile.id,
        headers: {'Authorization': "Bearer $userCredentials"},
      );
      if (response.statusCode == 200) {
        final downloadCredentials = response.data;
        logger.d('Got file response: $downloadCredentials');
        return downloadCredentials;
      } else {
        throw Exception('Wrong response: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e('Timeout while loading DownloadCredentials: $e');
        if (mounted) {
          context.router.maybePop();
          Fluttertoast.showToast(
            msg: context.l10n.downloadAssetError,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
        }
      }
    } catch (e) {
      logger.e('Error while loading DownloadCredentials: $e');
      rethrow;
    }
    return null;
  }

  Future<void> download() async {
    logger.i("Downloading file ${providerFile.name} "
        "from provider $providerFile");
    final backendService = Get.find<BackendService>();
    final providerFileService = Get.find<ProviderFileService>();
    setState(() => state = FileState.downloading);
    final userCredentials =
        await authService.buildUserCredentials(widget.provider.publicKey!);
    await backendService.backendApi
        .apiProvidersProviderIdFilesProviderFileIdGet(
      providerId: providerFile.provider,
      providerFileId: providerFile.id,
      headers: {
        'Authorization': "Bearer $userCredentials",
      },
    ).then((response) async {
      logger.d('Got file response: $response');
      final newProviderFile =
          await providerFileService.saveDownload(providerFile, response.data!);
      setState(() {
        state = FileState.present;
        providerFile = newProviderFile;
      });
    }).catchError((error) {
      logger.e('Error downloading file: $error');
      setState(() => state = FileState.missing);
      Fluttertoast.showToast(
        msg: context.l10n.downloadAssetError,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    });
  }

  Future<void> open() async {
    if (providerFile.download == null) {
      Fluttertoast.showToast(
        msg: "No file found",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    }
    context.router.push(InAppViewerViewRoute(providerFile: providerFile));
  }

  IconData get stateIndicatorIcon {
    if (state == FileState.missing) {
      return Icons.cloud_download;
    }
    return Icons.cloud_done;
  }

  Future<void> Function()? get onIconIdicatorPressed {
    switch (state) {
      case FileState.missing:
        return download;
      case FileState.present:
        return delete;
      case FileState.downloading:
        return null;
    }
  }

  Future<void> Function()? get onActionPressed {
    switch (state) {
      case FileState.missing:
        return download;
      case FileState.present:
        return open;
      case FileState.downloading:
        return null;
    }
  }

  String get buttonLabel {
    if (state == FileState.present) {
      return context.l10n.openReport;
    }
    return context.l10n.downloadReport;
  }

  bool get isLoading => state == FileState.downloading;

  String get createdAt {
    return DateFormat('dd.MM.yyyy').format(
      DateTime.fromMillisecondsSinceEpoch((providerFile.createdAt) * 1000),
    );
  }
}

class DocumentDetailsHeader extends StatelessWidget {
  const DocumentDetailsHeader({
    required this.title,
    required this.isLoading,
    required this.icon,
    required this.onIconIdicatorPressed,
    super.key,
    this.subTitle = "",
  });

  final String title;
  final String subTitle;
  final bool isLoading;
  final IconData icon;
  final Future<void> Function()? onIconIdicatorPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium,
                ),
                if (subTitle.isNotEmpty)
                  Text(
                    subTitle,
                    style: context.textTheme.titleSmall,
                  ),
              ],
            ),
          ),
          ProgressIconButton(
            isLoading: isLoading,
            icon: icon,
            onPressed: onIconIdicatorPressed,
          ),
        ],
      ),
    );
  }
}

class DocumentDetailsBody extends StatelessWidget {
  DocumentDetailsBody({
    required this.buttonLabel,
    super.key,
    this.description,
    this.onActionPressed,
    this.contentType,
  });

  final SettingsService settingsService = Get.find<SettingsService>();
  final String? description;
  final String buttonLabel;
  final Future<void> Function()? onActionPressed;
  final String? contentType;

  @override
  Widget build(BuildContext context) {
    final String displayText = description != null && description!.isNotEmpty
        ? description!
        : context.l10n.noDescriptionForAsset;
    final IconData icon =
        contentType != null && contentType!.startsWith("image")
            ? Icons.image
            : Icons.picture_as_pdf_rounded;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      "",
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: onActionPressed,
                label: Text(
                  buttonLabel,
                  style: context.textTheme.labelLarge,
                ),
                iconAlignment: IconAlignment.end,
                icon: Icon(icon),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.natural700_75,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Scrollbar(
              thickness: 8.0,
              radius: const Radius.circular(4.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    displayText,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (!settingsService.studyMode)
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/personal_settings_icon.png',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    context.l10n
                        .manageAuthorizationButton, // Replace appropriately
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
