// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:consent_management_app/src/common/models/provider_file.dart'
    as _i30;
import 'package:consent_management_app/src/common/widgets/app_progress_indicator_view.dart'
    as _i1;
import 'package:consent_management_app/src/common/widgets/error_view.dart'
    as _i7;
import 'package:consent_management_app/src/common/widgets/loading_screen_view.dart'
    as _i10;
import 'package:consent_management_app/src/common/widgets/no_data_view.dart'
    as _i19;
import 'package:consent_management_app/src/features/authentication/contact_study_staff_view.dart'
    as _i3;
import 'package:consent_management_app/src/features/authentication/id_scan_modal_view.dart'
    as _i8;
import 'package:consent_management_app/src/features/authentication/nfc_finish_view.dart'
    as _i15;
import 'package:consent_management_app/src/features/authentication/nfc_info_view.dart'
    as _i16;
import 'package:consent_management_app/src/features/authentication/nfc_scan_modal_view.dart'
    as _i17;
import 'package:consent_management_app/src/features/authentication/nfc_scan_view.dart'
    as _i18;
import 'package:consent_management_app/src/features/authentication/qr/mobile_scanner_overlay.dart'
    as _i2;
import 'package:consent_management_app/src/features/authentication/qr/qr_scan_view.dart'
    as _i21;
import 'package:consent_management_app/src/features/documents/details/document_details_view.dart'
    as _i4;
import 'package:consent_management_app/src/features/documents/preview/widgets/preview.dart'
    as _i9;
import 'package:consent_management_app/src/features/documents/view/documents_list_view.dart'
    as _i5;
import 'package:consent_management_app/src/features/documents/view/downloaded_documents_list_view.dart'
    as _i6;
import 'package:consent_management_app/src/features/menu/menu_view.dart'
    as _i12;
import 'package:consent_management_app/src/features/menu/my_data.dart' as _i13;
import 'package:consent_management_app/src/features/menu/my_studies.dart'
    as _i14;
import 'package:consent_management_app/src/features/onboarding/view/main_onboarding_view.dart'
    as _i11;
import 'package:consent_management_app/src/features/onboarding/view/welcome_onboarding_view.dart'
    as _i27;
import 'package:consent_management_app/src/features/providers/provider_list_view.dart'
    as _i20;
import 'package:consent_management_app/src/features/settings/settings_view.dart'
    as _i22;
import 'package:consent_management_app/src/features/studies/studies_list_view.dart'
    as _i23;
import 'package:consent_management_app/src/features/studies/study_data_selection_view.dart'
    as _i24;
import 'package:consent_management_app/src/features/studies/study_details_view.dart'
    as _i25;
import 'package:consent_management_app/src/features/studies/study_submitted_view.dart'
    as _i26;
import 'package:dwa_backend_api/dwa_backend_api.dart' as _i31;
import 'package:flutter/material.dart' as _i29;

/// generated route for
/// [_i1.AppProgressIndicatorView]
class AppProgressIndicatorViewRoute
    extends _i28.PageRouteInfo<AppProgressIndicatorViewRouteArgs> {
  AppProgressIndicatorViewRoute({
    required String title,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AppProgressIndicatorViewRoute.name,
          args: AppProgressIndicatorViewRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AppProgressIndicatorViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppProgressIndicatorViewRouteArgs>();
      return _i1.AppProgressIndicatorView(
        title: args.title,
        key: args.key,
      );
    },
  );
}

class AppProgressIndicatorViewRouteArgs {
  const AppProgressIndicatorViewRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final _i29.Key? key;

  @override
  String toString() {
    return 'AppProgressIndicatorViewRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [_i2.BarcodeScannerWithOverlayView]
class BarcodeScannerWithOverlayViewRoute extends _i28.PageRouteInfo<void> {
  const BarcodeScannerWithOverlayViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          BarcodeScannerWithOverlayViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarcodeScannerWithOverlayViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i2.BarcodeScannerWithOverlayView();
    },
  );
}

/// generated route for
/// [_i3.ContactStudyStaffView]
class ContactStudyStaffViewRoute
    extends _i28.PageRouteInfo<ContactStudyStaffViewRouteArgs> {
  ContactStudyStaffViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ContactStudyStaffViewRoute.name,
          args: ContactStudyStaffViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactStudyStaffViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactStudyStaffViewRouteArgs>();
      return _i3.ContactStudyStaffView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class ContactStudyStaffViewRouteArgs {
  const ContactStudyStaffViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'ContactStudyStaffViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}

/// generated route for
/// [_i4.DocumentDetailsView]
class DocumentDetailsViewRoute
    extends _i28.PageRouteInfo<DocumentDetailsViewRouteArgs> {
  DocumentDetailsViewRoute({
    required _i30.ProviderFile providerFile,
    required _i31.Provider provider,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          DocumentDetailsViewRoute.name,
          args: DocumentDetailsViewRouteArgs(
            providerFile: providerFile,
            provider: provider,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DocumentDetailsViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DocumentDetailsViewRouteArgs>();
      return _i4.DocumentDetailsView(
        providerFile: args.providerFile,
        provider: args.provider,
        key: args.key,
      );
    },
  );
}

class DocumentDetailsViewRouteArgs {
  const DocumentDetailsViewRouteArgs({
    required this.providerFile,
    required this.provider,
    this.key,
  });

  final _i30.ProviderFile providerFile;

  final _i31.Provider provider;

  final _i29.Key? key;

  @override
  String toString() {
    return 'DocumentDetailsViewRouteArgs{providerFile: $providerFile, provider: $provider, key: $key}';
  }
}

/// generated route for
/// [_i5.DocumentsListView]
class DocumentsListViewRoute
    extends _i28.PageRouteInfo<DocumentsListViewRouteArgs> {
  DocumentsListViewRoute({
    required _i31.Provider provider,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          DocumentsListViewRoute.name,
          args: DocumentsListViewRouteArgs(
            provider: provider,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DocumentsListViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DocumentsListViewRouteArgs>();
      return _i5.DocumentsListView(
        provider: args.provider,
        key: args.key,
      );
    },
  );
}

class DocumentsListViewRouteArgs {
  const DocumentsListViewRouteArgs({
    required this.provider,
    this.key,
  });

  final _i31.Provider provider;

  final _i29.Key? key;

  @override
  String toString() {
    return 'DocumentsListViewRouteArgs{provider: $provider, key: $key}';
  }
}

/// generated route for
/// [_i6.DownloadedDocumentsListView]
class DownloadedDocumentsListViewRoute
    extends _i28.PageRouteInfo<DownloadedDocumentsListViewRouteArgs> {
  DownloadedDocumentsListViewRoute({
    required _i31.Provider provider,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          DownloadedDocumentsListViewRoute.name,
          args: DownloadedDocumentsListViewRouteArgs(
            provider: provider,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DownloadedDocumentsListViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DownloadedDocumentsListViewRouteArgs>();
      return _i6.DownloadedDocumentsListView(
        args.provider,
        key: args.key,
      );
    },
  );
}

class DownloadedDocumentsListViewRouteArgs {
  const DownloadedDocumentsListViewRouteArgs({
    required this.provider,
    this.key,
  });

  final _i31.Provider provider;

  final _i29.Key? key;

  @override
  String toString() {
    return 'DownloadedDocumentsListViewRouteArgs{provider: $provider, key: $key}';
  }
}

/// generated route for
/// [_i7.ErrorView]
class ErrorViewRoute extends _i28.PageRouteInfo<void> {
  const ErrorViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ErrorViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i7.ErrorView();
    },
  );
}

/// generated route for
/// [_i8.IdScanModalView]
class IdScanModalViewRoute extends _i28.PageRouteInfo<void> {
  const IdScanModalViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          IdScanModalViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdScanModalViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i8.IdScanModalView();
    },
  );
}

/// generated route for
/// [_i9.InAppViewerView]
class InAppViewerViewRoute
    extends _i28.PageRouteInfo<InAppViewerViewRouteArgs> {
  InAppViewerViewRoute({
    required _i30.ProviderFile providerFile,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          InAppViewerViewRoute.name,
          args: InAppViewerViewRouteArgs(
            providerFile: providerFile,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InAppViewerViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InAppViewerViewRouteArgs>();
      return _i9.InAppViewerView(
        providerFile: args.providerFile,
        key: args.key,
      );
    },
  );
}

class InAppViewerViewRouteArgs {
  const InAppViewerViewRouteArgs({
    required this.providerFile,
    this.key,
  });

  final _i30.ProviderFile providerFile;

  final _i29.Key? key;

  @override
  String toString() {
    return 'InAppViewerViewRouteArgs{providerFile: $providerFile, key: $key}';
  }
}

/// generated route for
/// [_i10.LoadingScreenView]
class LoadingScreenViewRoute extends _i28.PageRouteInfo<void> {
  const LoadingScreenViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          LoadingScreenViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingScreenViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoadingScreenView();
    },
  );
}

/// generated route for
/// [_i11.MainOnboardingView]
class MainOnboardingViewRoute
    extends _i28.PageRouteInfo<MainOnboardingViewRouteArgs> {
  MainOnboardingViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          MainOnboardingViewRoute.name,
          args: MainOnboardingViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MainOnboardingViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainOnboardingViewRouteArgs>();
      return _i11.MainOnboardingView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class MainOnboardingViewRouteArgs {
  const MainOnboardingViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'MainOnboardingViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}

/// generated route for
/// [_i12.MenuView]
class MenuViewRoute extends _i28.PageRouteInfo<MenuViewRouteArgs> {
  MenuViewRoute({
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          MenuViewRoute.name,
          args: MenuViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MenuViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MenuViewRouteArgs>(
          orElse: () => const MenuViewRouteArgs());
      return _i12.MenuView(key: args.key);
    },
  );
}

class MenuViewRouteArgs {
  const MenuViewRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'MenuViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MyDataView]
class MyDataViewRoute extends _i28.PageRouteInfo<MyDataViewRouteArgs> {
  MyDataViewRoute({
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          MyDataViewRoute.name,
          args: MyDataViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MyDataViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyDataViewRouteArgs>(
          orElse: () => const MyDataViewRouteArgs());
      return _i13.MyDataView(key: args.key);
    },
  );
}

class MyDataViewRouteArgs {
  const MyDataViewRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'MyDataViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.MyStudiesView]
class MyStudiesViewRoute extends _i28.PageRouteInfo<void> {
  const MyStudiesViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          MyStudiesViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyStudiesViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i14.MyStudiesView();
    },
  );
}

/// generated route for
/// [_i15.NfcFinishView]
class NfcFinishViewRoute extends _i28.PageRouteInfo<NfcFinishViewRouteArgs> {
  NfcFinishViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          NfcFinishViewRoute.name,
          args: NfcFinishViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NfcFinishViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NfcFinishViewRouteArgs>();
      return _i15.NfcFinishView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class NfcFinishViewRouteArgs {
  const NfcFinishViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'NfcFinishViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}

/// generated route for
/// [_i16.NfcInfoView]
class NfcInfoViewRoute extends _i28.PageRouteInfo<NfcInfoViewRouteArgs> {
  NfcInfoViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          NfcInfoViewRoute.name,
          args: NfcInfoViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NfcInfoViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NfcInfoViewRouteArgs>();
      return _i16.NfcInfoView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class NfcInfoViewRouteArgs {
  const NfcInfoViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'NfcInfoViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}

/// generated route for
/// [_i17.NfcScanModalView]
class NfcScanModalViewRoute extends _i28.PageRouteInfo<void> {
  const NfcScanModalViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          NfcScanModalViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NfcScanModalViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i17.NfcScanModalView();
    },
  );
}

/// generated route for
/// [_i18.NfcScanView]
class NfcScanViewRoute extends _i28.PageRouteInfo<NfcScanViewRouteArgs> {
  NfcScanViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          NfcScanViewRoute.name,
          args: NfcScanViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NfcScanViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NfcScanViewRouteArgs>();
      return _i18.NfcScanView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class NfcScanViewRouteArgs {
  const NfcScanViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'NfcScanViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}

/// generated route for
/// [_i7.NoConnectionErrorView]
class NoConnectionErrorViewRoute extends _i28.PageRouteInfo<void> {
  const NoConnectionErrorViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          NoConnectionErrorViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoConnectionErrorViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i7.NoConnectionErrorView();
    },
  );
}

/// generated route for
/// [_i19.NoDownloadsView]
class NoDownloadsViewRoute extends _i28.PageRouteInfo<void> {
  const NoDownloadsViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          NoDownloadsViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoDownloadsViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i19.NoDownloadsView();
    },
  );
}

/// generated route for
/// [_i20.ProviderListView]
class ProviderListViewRoute
    extends _i28.PageRouteInfo<ProviderListViewRouteArgs> {
  ProviderListViewRoute({
    required bool loadFilesFromProvider,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ProviderListViewRoute.name,
          args: ProviderListViewRouteArgs(
            loadFilesFromProvider: loadFilesFromProvider,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProviderListViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProviderListViewRouteArgs>();
      return _i20.ProviderListView(
        loadFilesFromProvider: args.loadFilesFromProvider,
        key: args.key,
      );
    },
  );
}

class ProviderListViewRouteArgs {
  const ProviderListViewRouteArgs({
    required this.loadFilesFromProvider,
    this.key,
  });

  final bool loadFilesFromProvider;

  final _i29.Key? key;

  @override
  String toString() {
    return 'ProviderListViewRouteArgs{loadFilesFromProvider: $loadFilesFromProvider, key: $key}';
  }
}

/// generated route for
/// [_i21.QrScanView]
class QrScanViewRoute extends _i28.PageRouteInfo<QrScanViewRouteArgs> {
  QrScanViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          QrScanViewRoute.name,
          args: QrScanViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QrScanViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QrScanViewRouteArgs>();
      return _i21.QrScanView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class QrScanViewRouteArgs {
  const QrScanViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'QrScanViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}

/// generated route for
/// [_i22.SettingsView]
class SettingsViewRoute extends _i28.PageRouteInfo<void> {
  const SettingsViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SettingsViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i22.SettingsView();
    },
  );
}

/// generated route for
/// [_i23.StudiesListView]
class StudiesListViewRoute extends _i28.PageRouteInfo<void> {
  const StudiesListViewRoute({List<_i28.PageRouteInfo>? children})
      : super(
          StudiesListViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudiesListViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i23.StudiesListView();
    },
  );
}

/// generated route for
/// [_i24.StudyDataSelectionView]
class StudyDataSelectionViewRoute
    extends _i28.PageRouteInfo<StudyDataSelectionViewRouteArgs> {
  StudyDataSelectionViewRoute({
    required _i31.Study study,
    required List<_i31.ApiProviderFile> providerFiles,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          StudyDataSelectionViewRoute.name,
          args: StudyDataSelectionViewRouteArgs(
            study: study,
            providerFiles: providerFiles,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudyDataSelectionViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudyDataSelectionViewRouteArgs>();
      return _i24.StudyDataSelectionView(
        study: args.study,
        providerFiles: args.providerFiles,
        key: args.key,
      );
    },
  );
}

class StudyDataSelectionViewRouteArgs {
  const StudyDataSelectionViewRouteArgs({
    required this.study,
    required this.providerFiles,
    this.key,
  });

  final _i31.Study study;

  final List<_i31.ApiProviderFile> providerFiles;

  final _i29.Key? key;

  @override
  String toString() {
    return 'StudyDataSelectionViewRouteArgs{study: $study, providerFiles: $providerFiles, key: $key}';
  }
}

/// generated route for
/// [_i25.StudyDetailsView]
class StudyDetailsViewRoute
    extends _i28.PageRouteInfo<StudyDetailsViewRouteArgs> {
  StudyDetailsViewRoute({
    required _i31.Study study,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          StudyDetailsViewRoute.name,
          args: StudyDetailsViewRouteArgs(
            study: study,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudyDetailsViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudyDetailsViewRouteArgs>();
      return _i25.StudyDetailsView(
        study: args.study,
        key: args.key,
      );
    },
  );
}

class StudyDetailsViewRouteArgs {
  const StudyDetailsViewRouteArgs({
    required this.study,
    this.key,
  });

  final _i31.Study study;

  final _i29.Key? key;

  @override
  String toString() {
    return 'StudyDetailsViewRouteArgs{study: $study, key: $key}';
  }
}

/// generated route for
/// [_i26.StudySubmittedView]
class StudySubmittedViewRoute
    extends _i28.PageRouteInfo<StudySubmittedViewRouteArgs> {
  StudySubmittedViewRoute({
    required List<_i31.StudySharedFile> sharedFiles,
    required String studyTitle,
    required String organization,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          StudySubmittedViewRoute.name,
          args: StudySubmittedViewRouteArgs(
            sharedFiles: sharedFiles,
            studyTitle: studyTitle,
            organization: organization,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudySubmittedViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudySubmittedViewRouteArgs>();
      return _i26.StudySubmittedView(
        sharedFiles: args.sharedFiles,
        studyTitle: args.studyTitle,
        organization: args.organization,
        key: args.key,
      );
    },
  );
}

class StudySubmittedViewRouteArgs {
  const StudySubmittedViewRouteArgs({
    required this.sharedFiles,
    required this.studyTitle,
    required this.organization,
    this.key,
  });

  final List<_i31.StudySharedFile> sharedFiles;

  final String studyTitle;

  final String organization;

  final _i29.Key? key;

  @override
  String toString() {
    return 'StudySubmittedViewRouteArgs{sharedFiles: $sharedFiles, studyTitle: $studyTitle, organization: $organization, key: $key}';
  }
}

/// generated route for
/// [_i27.WelcomeOnboardingView]
class WelcomeOnboardingViewRoute
    extends _i28.PageRouteInfo<WelcomeOnboardingViewRouteArgs> {
  WelcomeOnboardingViewRoute({
    required _i29.VoidCallback onConfirm,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          WelcomeOnboardingViewRoute.name,
          args: WelcomeOnboardingViewRouteArgs(
            onConfirm: onConfirm,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeOnboardingViewRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WelcomeOnboardingViewRouteArgs>();
      return _i27.WelcomeOnboardingView(
        onConfirm: args.onConfirm,
        key: args.key,
      );
    },
  );
}

class WelcomeOnboardingViewRouteArgs {
  const WelcomeOnboardingViewRouteArgs({
    required this.onConfirm,
    this.key,
  });

  final _i29.VoidCallback onConfirm;

  final _i29.Key? key;

  @override
  String toString() {
    return 'WelcomeOnboardingViewRouteArgs{onConfirm: $onConfirm, key: $key}';
  }
}
