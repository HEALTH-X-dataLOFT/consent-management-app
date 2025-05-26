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
import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/features/documents/widgets/mime_type_badge.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:consent_management_app/src/routing/router.gr.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class CustomGroupedList extends StatelessWidget {
  const CustomGroupedList(
    this.providerFiles, {
    required this.provider,
    super.key,
  });

  final List<ProviderFile> providerFiles;
  final Provider provider;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<ProviderFile, String>(
      elements: providerFiles,
      groupBy: (element) {
        return DateFormat('yyyy').format(
          DateTime.fromMillisecondsSinceEpoch((element.createdAt) * 1000),
        );
      },
      groupComparator: (value1, value2) => value1.compareTo(value2),
      itemComparator: (item1, item2) => item1.id.compareTo(item2.id),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: false,
      groupSeparatorBuilder: (String value) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      },
      itemBuilder: (context, providerFile) {
        return DocumentListTile(
          providerFile: providerFile,
          provider: provider,
        );
      },
    );
  }
}

class DocumentListTile extends StatelessWidget {
  const DocumentListTile({
    required this.providerFile,
    required this.provider,
    super.key,
  });

  final ProviderFile providerFile;
  final Provider provider;

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd.MM.yyyy').format(
      DateTime.fromMillisecondsSinceEpoch(providerFile.createdAt * 1000),
    );
    return Column(
      children: [
        const SizedBox(height: 12),
        if (providerFile.download != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                context.l10n.downloaded_indicator,
                style: context.textTheme.labelSmall,
              ),
              // Hardcoded padding parallel to the list tile
              const SizedBox(width: 24),
            ],
          ),
        ListTile(
          visualDensity: const VisualDensity(vertical: 3),
          title: Row(
            children: [
              const SizedBox(width: 5.0),
              Flexible(
                child: Text(
                  providerFile.name ??
                      context.l10n.no_provider_name_placeholder,
                  style: context.textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 5.0),
              MimeTypeBadge(mimeType: providerFile.mimeType ?? ""),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formattedDate,
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward),
            ],
          ),
          onTap: providerFile.name != null
              ? () {
                  context.router.push(
                    DocumentDetailsViewRoute(
                      providerFile: providerFile,
                      provider: provider,
                    ),
                  );
                }
              : null,
        ),
        const Divider(),
      ],
    );
  }
}
