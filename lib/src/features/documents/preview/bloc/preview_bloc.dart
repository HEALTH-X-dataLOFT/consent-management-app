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

import 'package:consent_management_app/src/common/models/provider_file.dart';
import 'package:consent_management_app/src/features/documents/data/provider_file_service.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/fallback_preview_provider.dart';
import 'package:consent_management_app/src/features/documents/preview/provider/preview_provider.dart';
import 'package:consent_management_app/src/utils/extensions/list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'preview_event.dart';
part 'preview_state.dart';

class PreviewBloc extends Bloc<PreviewEvent, PreviewState> {
  PreviewBloc._({
    required PreviewState initialState,
    required this.mode,
    required this.providers,
  }) : super(initialState) {
    on<PreviewEvent>(_onPreviewEvent);
    add(_PreviewStarted());
    _providerFileService = Get.find<ProviderFileService>();
    _changeSubscription =
        _providerFileService.changes(initialState.providerFile).listen((data) {
      add(_PreviewGotUpdate(providerFile: data));
    });
  }

  PreviewBloc.initial({
    required List<PreviewProvider> providers,
    required PreviewMode mode,
    required ProviderFile providerFile,
  }) : this._(
          initialState: PreviewLoading(providerFile: providerFile),
          mode: mode,
          providers: providers,
        );

  late final ProviderFileService _providerFileService;
  late final StreamSubscription _changeSubscription;
  final List<PreviewProvider> providers;
  final PreviewMode mode;

  @override
  Future<void> close() {
    _changeSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onPreviewEvent(
    PreviewEvent event,
    Emitter<PreviewState> emit,
  ) async {
    switch (event) {
      case final _PreviewStarted _:
        final download = state.providerFile.download;
        if (download == null) {
          emit(
            PreviewNotAvailable(
              providerFile: state.providerFile,
            ),
          );
        } else {
          final data = await download.getData();
          emit(
            PreviewLoaded(
              data: data,
              providerFile: state.providerFile,
            ),
          );
          await _nextProvider(emit);
        }
      case final _PreviewGotUpdate e:
        if (e.providerFile.download == null) {
          emit(PreviewNotAvailable(providerFile: e.providerFile));
        } else {
          final data = await e.providerFile.download!.getData();
          emit(
            PreviewLoaded(
              data: data,
              providerFile: e.providerFile,
            ),
          );
          await _nextProvider(emit);
        }
      case final PreviewDisplayError e:
        switch (state) {
          case final PreviewReady<dynamic> s:
            if (s.provider == e.provider) {
              await _nextProvider(emit);
            }
          default:
        }
    }
  }

  FutureOr<void> _nextProvider(
    Emitter<PreviewState> emit,
  ) async {
    final Uint8List data;
    switch (state) {
      case final PreviewLoaded s:
        data = s.data;
      case final PreviewReady<dynamic> s:
        data = s.data;
      default:
        throw "Can only try providers if data has been loaded.";
    }

    final mimeType = state.providerFile.mimeType ?? '';

    var lastProvider =
        (state is PreviewReady) ? (state as PreviewReady).provider : null;

    while (true) {
      final provider = lastProvider == null
          ? providers.first
          : providers.after(lastProvider) ?? FallbackPreviewProvider.instance;
      lastProvider = provider;

      if (!provider.canHandle(
        mimeType: mimeType,
        data: data,
        providerFile: state.providerFile,
        mode: mode,
      )) continue;

      final dynamic prepared;
      try {
        prepared = await provider.prepare(
          data,
          providerFile: state.providerFile,
          mode: mode,
        );
      } catch (e) {
        continue;
      }

      emit(
        PreviewReady(
          provider: provider,
          prepared: prepared,
          data: data,
          providerFile: state.providerFile,
        ),
      );

      break;
    }
  }

  void Function(Object error) createHandleError(PreviewProvider provider) {
    return (error) {
      add(PreviewDisplayError(provider: provider, error: error));
    };
  }

  @override
  String toString() {
    return 'PreviewBloc{mode: $mode, providers: ${providers.map((provider) => provider.runtimeType)}}';
  }
}
