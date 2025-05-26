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


part of 'preview_bloc.dart';

@immutable
sealed class PreviewEvent {}

final class _PreviewStarted extends PreviewEvent {}

/// Backend Repository fetched data.
final class _PreviewGotUpdate extends PreviewEvent {
  _PreviewGotUpdate({required this.providerFile});

  final ProviderFile providerFile;
}

/// Error while displaying a widget
final class PreviewDisplayError extends PreviewEvent {
  PreviewDisplayError({required this.provider, required this.error});

  final PreviewProvider provider;
  final Object error;
}
