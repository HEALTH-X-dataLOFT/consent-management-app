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
import 'package:built_collection/built_collection.dart';
import 'package:consent_management_app/src/common/errors/exception.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/common/widgets/app_bar.dart';
import 'package:consent_management_app/src/common/widgets/app_progress_indicator_view.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/features/settings/settings_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

@RoutePage()
class StudyDetailsView extends StatefulWidget {
  final Study study;

  const StudyDetailsView({
    required this.study,
    super.key,
  });

  @override
  State<StudyDetailsView> createState() => _StudyDetailsViewState();
}

class _StudyDetailsViewState extends State<StudyDetailsView> {
  var _loadingFinished = true;
  final SettingsService settingsService = Get.find<SettingsService>();

  // ignore: unused_element
  void _showAlertDialog(BuildContext context, Study study) {
    // set up the buttons
    final Widget cancelButton = ElevatedButton(
      child: Text(context.l10n.cancel),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    final Widget continueButton = ElevatedButton(
      child: Text(context.l10n.submit),
      onPressed: () {
        Navigator.of(context).pop();
        _submitDataToStudy(context);
      },
    ); // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      title: Text(context.l10n.studySubmissionAlertTitle),
      content: Text(context.l10n.studySubmissionAlertMessage),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _submitDataToStudy(BuildContext context) {
    logger.d("Should collate and submit data to study");
    final backendService = Get.find<BackendService>();
    final pfList = BuiltList<ApiProviderFile>.from([]);
    logger.d("Submitting data to study ${widget.study.id}");

    setState(() {
      _loadingFinished = false;
    });

    backendService.backendApi
        .apiStudiesStudyIdPost(
      studyId: widget.study.id!,
      apiProviderFile: pfList,
    )
        .then((response) {
      logger.d("Successfully submitted data to study ${widget.study.id}");
      logger.d("Got these files as response: ${response.data}");
      final sharedFiles = response.data?.asList() ?? [];
      if (sharedFiles.isEmpty) {
        throw Exception("No files were shared from study");
      }
      context.router.push(
        StudySubmittedViewRoute(
          sharedFiles: sharedFiles,
          studyTitle: widget.study.name!,
          organization: widget.study.organization!.name!,
        ),
      );
      context.router.popUntilRoot();
    }).catchError((error) {
      logger.e(
        "Error submitting data to study ${widget.study.id}",
        error: error,
      );
      Fluttertoast.showToast(
        msg: context.l10n.studySubmissionFailed,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    });

    setState(() {
      _loadingFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d("Building StudyDetailsView");
    return _loadingFinished
        ? Scaffold(
            appBar: const CustomAppBar(),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.study.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text(context.l10n.researchOrganizationTitle),
                  subtitle: Text(widget.study.organization!.name!),
                ),
                const Divider(),
                MarkdownBody(
                  data: widget.study.description!.replaceAll(r'\n', '\n'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (settingsService.featureStudyParticipation)
                      FilledButton(
                        onPressed: () async {
                          final backendService = Get.find<BackendService>();
                          try {
                            final studyId = widget.study.id;
                            if (studyId == null) {
                              throw const CmaException("study has no id");
                            }
                            final result =
                                await backendService.dummyParticipateInStudy(
                              studyId,
                            );
                            if (result) {
                              if (context.mounted) {
                                Fluttertoast.showToast(
                                  msg: context.l10n.studySubmitted,
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                );
                              }
                            } else {
                              throw const CmaException(
                                "Study submission was not successful",
                              );
                            }
                          } catch (error) {
                            logger.d("Error submitting study: $error");
                            if (context.mounted) {
                              Fluttertoast.showToast(
                                msg: context.l10n.studySubmissionFailed,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                              );
                            }
                          }
                        },
                        child: Text(
                          context.l10n.studyParticipate,
                        ),
                      ),
                    if (settingsService.featureStudyParticipation)
                      OutlinedButton(
                        onPressed: null, //disabled
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.natural700_75,
                        ),
                        child: Row(
                          children: [
                            Text(context.l10n.studyShare),
                            const Icon(Icons.share),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )
        : AppProgressIndicatorView(
            title: context.l10n.studySubmissionInProgress,
          );
  }
}
