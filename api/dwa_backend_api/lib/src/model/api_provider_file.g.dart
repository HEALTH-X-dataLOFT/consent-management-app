// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider_file.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiProviderFile extends ApiProviderFile {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? createdAt;
  @override
  final String? mimeType;
  @override
  final int? size;
  @override
  final Provider? provider;

  factory _$ApiProviderFile([void Function(ApiProviderFileBuilder)? updates]) =>
      (new ApiProviderFileBuilder()..update(updates))._build();

  _$ApiProviderFile._(
      {this.id,
      this.name,
      this.description,
      this.createdAt,
      this.mimeType,
      this.size,
      this.provider})
      : super._();

  @override
  ApiProviderFile rebuild(void Function(ApiProviderFileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiProviderFileBuilder toBuilder() =>
      new ApiProviderFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiProviderFile &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        createdAt == other.createdAt &&
        mimeType == other.mimeType &&
        size == other.size &&
        provider == other.provider;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiProviderFile')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('mimeType', mimeType)
          ..add('size', size)
          ..add('provider', provider))
        .toString();
  }
}

class ApiProviderFileBuilder
    implements Builder<ApiProviderFile, ApiProviderFileBuilder> {
  _$ApiProviderFile? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  ProviderBuilder? _provider;
  ProviderBuilder get provider => _$this._provider ??= new ProviderBuilder();
  set provider(ProviderBuilder? provider) => _$this._provider = provider;

  ApiProviderFileBuilder() {
    ApiProviderFile._defaults(this);
  }

  ApiProviderFileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _mimeType = $v.mimeType;
      _size = $v.size;
      _provider = $v.provider?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiProviderFile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiProviderFile;
  }

  @override
  void update(void Function(ApiProviderFileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiProviderFile build() => _build();

  _$ApiProviderFile _build() {
    _$ApiProviderFile _$result;
    try {
      _$result = _$v ??
          new _$ApiProviderFile._(
              id: id,
              name: name,
              description: description,
              createdAt: createdAt,
              mimeType: mimeType,
              size: size,
              provider: _provider?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'provider';
        _provider?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiProviderFile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
