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
import 'package:consent_management_app/src/routing/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,ViewRoute')
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});

  final AutoRouteGuard authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ProviderListViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: DocumentDetailsViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: MenuViewRoute.page,
          guards: [authGuard],
          initial: true,
        ),
        AutoRoute(
          page: DocumentsListViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: DownloadedDocumentsListViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: SettingsViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: StudiesListViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: StudyDetailsViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: StudyDataSelectionViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: MainOnboardingViewRoute.page,
        ),
        AutoRoute(
          page: StudySubmittedViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(page: WelcomeOnboardingViewRoute.page),
        AutoRoute(page: MainOnboardingViewRoute.page),
        AutoRoute(
          page: MyDataViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: MyStudiesViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          page: InAppViewerViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(page: NoConnectionErrorViewRoute.page),
        AutoRoute(page: ErrorViewRoute.page),
        AutoRoute(page: NfcInfoViewRoute.page),
        AutoRoute(page: NfcScanViewRoute.page),
        AutoRoute(page: NfcFinishViewRoute.page),
        AutoRoute(page: QrScanViewRoute.page),
        AutoRoute(page: BarcodeScannerWithOverlayViewRoute.page),
        CustomRoute(
          page: NfcScanModalViewRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          fullscreenDialog: false,
          opaque: false,
        ),
        CustomRoute(
          page: IdScanModalViewRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          fullscreenDialog: false,
          opaque: false,
        ),
        CustomRoute(
          page: LoadingScreenViewRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          fullscreenDialog: false,
          opaque: false,
        ),
        AutoRoute(
          page: NoDownloadsViewRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(page: ContactStudyStaffViewRoute.page),
      ];
}
