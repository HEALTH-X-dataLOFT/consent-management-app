// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResearchData extends ResearchData {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? dataType;
  @override
  final AccessType? accessType;

  factory _$ResearchData([void Function(ResearchDataBuilder)? updates]) =>
      (new ResearchDataBuilder()..update(updates))._build();

  _$ResearchData._(
      {this.name, this.description, this.dataType, this.accessType})
      : super._();

  @override
  ResearchData rebuild(void Function(ResearchDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResearchDataBuilder toBuilder() => new ResearchDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResearchData &&
        name == other.name &&
        description == other.description &&
        dataType == other.dataType &&
        accessType == other.accessType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, dataType.hashCode);
    _$hash = $jc(_$hash, accessType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResearchData')
          ..add('name', name)
          ..add('description', description)
          ..add('dataType', dataType)
          ..add('accessType', accessType))
        .toString();
  }
}

class ResearchDataBuilder
    implements Builder<ResearchData, ResearchDataBuilder> {
  _$ResearchData? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _dataType;
  String? get dataType => _$this._dataType;
  set dataType(String? dataType) => _$this._dataType = dataType;

  AccessType? _accessType;
  AccessType? get accessType => _$this._accessType;
  set accessType(AccessType? accessType) => _$this._accessType = accessType;

  ResearchDataBuilder() {
    ResearchData._defaults(this);
  }

  ResearchDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _dataType = $v.dataType;
      _accessType = $v.accessType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResearchData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResearchData;
  }

  @override
  void update(void Function(ResearchDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResearchData build() => _build();

  _$ResearchData _build() {
    final _$result = _$v ??
        new _$ResearchData._(
            name: name,
            description: description,
            dataType: dataType,
            accessType: accessType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
