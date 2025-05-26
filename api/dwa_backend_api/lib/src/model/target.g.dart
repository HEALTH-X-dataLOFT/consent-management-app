// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Target extends Target {
  @override
  final String? provider;
  @override
  final String? file;

  factory _$Target([void Function(TargetBuilder)? updates]) =>
      (new TargetBuilder()..update(updates))._build();

  _$Target._({this.provider, this.file}) : super._();

  @override
  Target rebuild(void Function(TargetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TargetBuilder toBuilder() => new TargetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Target && provider == other.provider && file == other.file;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Target')
          ..add('provider', provider)
          ..add('file', file))
        .toString();
  }
}

class TargetBuilder implements Builder<Target, TargetBuilder> {
  _$Target? _$v;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _file;
  String? get file => _$this._file;
  set file(String? file) => _$this._file = file;

  TargetBuilder() {
    Target._defaults(this);
  }

  TargetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provider = $v.provider;
      _file = $v.file;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Target other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Target;
  }

  @override
  void update(void Function(TargetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Target build() => _build();

  _$Target _build() {
    final _$result = _$v ?? new _$Target._(provider: provider, file: file);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
