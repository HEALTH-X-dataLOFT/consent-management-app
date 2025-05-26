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
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

@RoutePage()
class StudiesListView extends StatefulWidget {
  const StudiesListView({super.key});

  @override
  StudiesListViewState createState() => StudiesListViewState();
}

class StudiesListViewState extends State<StudiesListView> {
  List<Study> _studies = <Study>[];
  @override
  void initState() {
    logger.d("Initiating state in StudiesList");
    super.initState();
    _getStudies(context);
  }

  Future<void> _getStudies(BuildContext context) async {
    logger.d("Getting list of studies in StudiesList");
    final backendService = Get.find<BackendService>();
    backendService.backendApi.apiStudiesGet().then((response) {
      logger.d('Got studies: $response');
      setState(() {
        _studies = response.data?.asList() ?? [];
      });
    }).catchError((error) {
      logger.e('Error getting studies: $error');
      Fluttertoast.showToast(
        msg: context.l10n.errorGettingStudies,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d("Building StudiesList");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(context.l10n.studiesTitle),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(4.0),
        itemCount: _studies.length,
        itemBuilder: (context, index) {
          final study = _studies[index];
          return ListTile(
            title: Text(study.name!),
            subtitle: Text(study.descriptionSummary!),
            onTap: () {
              context.router.push(
                StudyDetailsViewRoute(study: study),
              );
            },
            trailing: const Icon(Icons.info_outline),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
