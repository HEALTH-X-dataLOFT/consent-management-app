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
import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:consent_management_app/src/common/theme/theme.dart';
import 'package:consent_management_app/src/common/widgets/svg_icon.dart';
import 'package:consent_management_app/src/localization/l10n.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenu;
  final DownloadCredentials? downloadCredentials;
  final Provider? provider;
  static const String iconPath = 'assets/images/share_icon.svg';

  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.showMenu = false,
    this.downloadCredentials,
    this.provider,
    this.actions = const [],
  });

  Uri? get downloadCredentialsUriMammojourney {
    if (downloadCredentials != null &&
        downloadCredentials!.url!.contains('iop-provider')) {
      return Uri(
        scheme: 'healthx',
        host: 'mammojourney',
        path: 'open_file',
        queryParameters: {
          'authentication_type':
              downloadCredentials!.authenticationType.toString(),
          'provider_url': downloadCredentials!.url,
          'username': downloadCredentials!.username,
          'password': downloadCredentials!.password,
        },
      );
    }
    return null;
  }

  Uri? get downloadCredentialsUriPharme {
    if (downloadCredentials != null &&
        downloadCredentials!.url!.contains('hpi-datastore.duckdns.org')) {
      return Uri(
        scheme: 'healthx',
        host: 'pharme',
        path: 'open_file',
        queryParameters: {
          'authentication_type':
              downloadCredentials!.authenticationType.toString(),
          'provider_url': downloadCredentials!.url,
          'username': downloadCredentials!.username,
          'password': downloadCredentials!.password,
        },
      );
    }
    return null;
  }

  Future<void> _launchNonBrowserViewFromUri(
    Uri? uri,
    BuildContext context,
  ) async {
    final localizations = context.l10n;
    if (uri == null) {
      Fluttertoast.showToast(
        msg: localizations.dataStillLoading,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    } else if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
    } else {
      Fluttertoast.showToast(
        msg: localizations.notInstalled,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: () {
          context.router.maybePop();
        },
        child: const Row(
          children: [
            SizedBox(width: 20),
            Icon(Icons.arrow_back, color: AppColors.natural700_75),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      title: GestureDetector(
        onTap: () => context.router.maybePop(),
        child:
            Text(context.l10n.backButton, style: context.textTheme.labelLarge),
      ),
      actions: [
        ...actions,
        if (showMenu)
          Transform.translate(
            offset: const Offset(-10, 0),
            child: PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: AppColors.natural700_75),
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: context.colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
              itemBuilder: (context) {
                final isMammojourneyProvider =
                    provider?.providerUrl?.contains('iop') ?? false;
                final isPharmeProvider =
                    provider?.providerUrl?.contains('hpi') ?? false;

                final List<PopupMenuEntry<int>> items = [];
                if (isMammojourneyProvider) {
                  items.add(
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          const SvgIcon(path: iconPath, size: 13),
                          const SizedBox(width: 8),
                          Text(context.l10n.mammojourney),
                        ],
                      ),
                      onTap: () => _launchNonBrowserViewFromUri(
                        downloadCredentialsUriMammojourney,
                        context,
                      ),
                    ),
                  );
                }
                if (isPharmeProvider) {
                  items.add(
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          const SvgIcon(path: iconPath, size: 13),
                          const SizedBox(width: 8),
                          Text(context.l10n.pharme),
                        ],
                      ),
                      onTap: () => _launchNonBrowserViewFromUri(
                        downloadCredentialsUriPharme,
                        context,
                      ),
                    ),
                  );
                }
                return items;
              },
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
