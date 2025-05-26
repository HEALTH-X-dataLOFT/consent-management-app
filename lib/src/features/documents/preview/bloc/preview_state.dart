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
sealed class PreviewState extends Equatable {
  const PreviewState({
    required this.providerFile,
  });

  final ProviderFile providerFile;
}

final class PreviewLoading extends PreviewState {
  const PreviewLoading({
    required super.providerFile,
  });

  @override
  List<Object?> get props => [providerFile];
}

/// Not available because no download / no thumbnail
final class PreviewNotAvailable extends PreviewState {
  const PreviewNotAvailable({
    required super.providerFile,
  });

  @override
  List<Object?> get props => [providerFile];
}

final class PreviewLoaded extends PreviewState {
  const PreviewLoaded({
    required this.data,
    required super.providerFile,
  });

  final Uint8List data;

  @override
  List<Object?> get props => [providerFile, data];

  @override
  String toString() {
    return 'PreviewLoaded{providerFile: [name: ${providerFile.name}, ...], ...}';
  }
}

final class PreviewReady<T> extends PreviewState {
  PreviewReady({
    required this.provider,
    required this.prepared,
    required this.data,
    required super.providerFile,
  });

  final Uint8List data;
  final PreviewProvider<T> provider;
  final T prepared;
  final Key key = UniqueKey();

  @override
  List<Object?> get props => [providerFile, data, providerFile, prepared];

  @override
  String toString() {
    return 'PreviewReady{provider: $provider, prepared: $prepared, providerFile: [name: ${providerFile.name}, ...], ...}';
  }
}
