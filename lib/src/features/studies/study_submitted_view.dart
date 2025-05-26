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
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

@RoutePage()
class StudySubmittedView extends StatelessWidget {
  const StudySubmittedView({
    required this.sharedFiles,
    required this.studyTitle,
    required this.organization,
    super.key,
  });

  final String studyTitle;
  final String organization;
  final List<StudySharedFile> sharedFiles;

  @override
  Widget build(BuildContext context) {
    var submittedFiles = "\n";
    for (var i = 0; i < sharedFiles.length; i++) {
      submittedFiles += "* ${sharedFiles[i].name}\n";
    }
    final steps = <Step>[
      Step(
        title: Text(context.l10n.studySubmittedStep1),
        content: const Row(),
        isActive: true,
      ),
      Step(
        title: Text(context.l10n.studySubmittedStep2),
        content: const Row(),
      ),
      Step(
        title: Text(context.l10n.studySubmittedStep3),
        content: const Row(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.studySubmittedTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: <Widget>[
          Text(context.l10n.studySubmitted),
          const Divider(),
          ListTile(
            title: Text(context.l10n.studyTitle),
            subtitle: Text(studyTitle),
          ),
          ListTile(
            title: Text(context.l10n.researchOrganizationTitle),
            subtitle: Text(organization),
          ),
          const Divider(),
          MarkdownBody(data: context.l10n.studySubmittedFiles + submittedFiles),
          Stepper(
            controlsBuilder: (context, details) {
              return const Row();
            },
            steps: steps,
            currentStep: 0,
            type: StepperType.vertical,
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              context.router.popUntilRoot();
            },
            child: Text(context.l10n.continueButton),
          ),
        ],
      ),
    );
  }
}
