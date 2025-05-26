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

import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:flutter/material.dart';

enum DocumentsSelection { all, records, documents }

class DocumentTypeQuickFilter extends StatefulWidget {
  const DocumentTypeQuickFilter({
    required this.showSegmentTitle,
    super.key,
  });

  final bool showSegmentTitle;

  @override
  State<DocumentTypeQuickFilter> createState() =>
      _DocumentTypeQuickFilterState();
}

class _DocumentTypeQuickFilterState extends State<DocumentTypeQuickFilter> {
  DocumentsSelection selectedValue = DocumentsSelection.all;

  String localiseDocumentsSelection(
    AppLocalizations l10n,
    DocumentsSelection selection,
  ) {
    switch (selection) {
      case DocumentsSelection.all:
        return l10n.documents_selection_all;
      case DocumentsSelection.records:
        return l10n.documents_selection_records;
      case DocumentsSelection.documents:
        return l10n.documents_selection_documents;
    }
  }

  String localiseDocumentsSelectionDescription(
    AppLocalizations l10n,
    DocumentsSelection selection,
  ) {
    switch (selection) {
      case DocumentsSelection.all:
        return l10n.documents_selection_all_description;
      case DocumentsSelection.records:
        return l10n.documents_selection_records_description;
      case DocumentsSelection.documents:
        return l10n.documents_selection_documents_description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SegmentedButton<DocumentsSelection>(
              segments: DocumentsSelection.values
                  .map<ButtonSegment<DocumentsSelection>>(
                (item) {
                  return ButtonSegment(
                    value: item,
                    label: DocumentsSelectionText(
                      localiseDocumentsSelection(l10n, item),
                    ),
                  );
                },
              ).toList(),
              selected: {selectedValue},
              onSelectionChanged: (Set<DocumentsSelection> newSelection) {
                setState(() {
                  selectedValue = newSelection.first;
                });
              },
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) => AppColors.natural10,
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.primary80;
                    }
                    return AppColors.white;
                  },
                ),
              ),
              showSelectedIcon: true,
            ),
            if (widget.showSegmentTitle)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                    child: Text(
                      localiseDocumentsSelectionDescription(
                        l10n,
                        selectedValue,
                      ),
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ],
              )
            else
              Container(),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

Widget constraintsForText(String text) {
  return ConstrainedBox(
    constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
    child: Center(child: Text(text)),
  );
}

class DocumentsSelectionText extends StatelessWidget {
  const DocumentsSelectionText(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
      child: Center(
        child: Text(
          label,
        ),
      ),
    );
  }
}
