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
import 'package:consent_management_app/src/features/documents/data/backend_service.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

@RoutePage()
class StudyDataSelectionView extends StatefulWidget {
  final Study study;
  final List<ApiProviderFile> providerFiles;

  const StudyDataSelectionView({
    required this.study,
    required this.providerFiles,
    super.key,
  });

  @override
  StudyDataSelectionViewState createState() => StudyDataSelectionViewState();
}

class StudyDataSelectionViewState extends State<StudyDataSelectionView> {
  Map<String, List<ApiProviderFile>> _providerMap = {};
  final Map<String, bool> _selectedFiles = {};

  @override
  void initState() {
    logger.d("Initiating state in StudyDataSelectionView");
    super.initState();
    _initMaps();
  }

  void _initMaps() {
    final Map<String, List<ApiProviderFile>> providerMap = {};
    for (final providerFile in widget.providerFiles) {
      _selectedFiles[providerFile.id!] = false;
      final provider = providerFile.provider;
      final providerName = provider?.name ?? "Unknown Provider";
      if (!providerMap.containsKey(providerName)) {
        providerMap[providerName] = [];
      }
      providerMap[providerName]!.add(providerFile);
    }
    setState(() {
      _providerMap = providerMap;
    });
  }

  void _submitDataToStudy(BuildContext context) {
    logger.d("Should collate and submit data to study");
    final filesToSubmit = widget.providerFiles
        .where((pf) => _selectedFiles[pf.id] ?? false)
        .toList();
    final backendService = Get.find<BackendService>();
    final pfList = BuiltList<ApiProviderFile>.from(filesToSubmit);
    logger.d("Submitting data to study ${widget.study.id}");
    backendService.backendApi
        .apiStudiesStudyIdPost(
      studyId: widget.study.id!,
      apiProviderFile: pfList,
    )
        .then((response) {
      logger.d("Successfully submitted data to study ${widget.study.id}");
      Fluttertoast.showToast(
        msg: context.l10n.studySubmitted,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      context.router.popUntilRoot();
    }).catchError((error) {
      logger.e(
        "Error submitting data to study ${widget.study.id}",
        error: error,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d("Building StudyDataSelectionView");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study Data Selection"),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              _submitDataToStudy(context);
            },
            icon: const Icon(Icons.mail),
            label: Text(context.l10n.submit),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _providerMap.length,
        itemBuilder: (context, index) {
          final provider = _providerMap.keys.elementAt(index);
          final providerFiles = _providerMap[provider] ?? [];
          return ExpansionTile(
            title: Text(provider),
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: providerFiles.length,
                itemBuilder: (context, index) {
                  final providerFile = providerFiles[index];
                  return CheckboxListTile(
                    title: Text(providerFile.name ?? "Unknown File"),
                    subtitle: Text(
                      providerFile.description ?? "No description available",
                    ),
                    value: _selectedFiles[providerFile.id!],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedFiles[providerFile.id!] = value!;
                      });
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
