// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_shared_file.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StudySharedFile extends StudySharedFile {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;

  factory _$StudySharedFile([void Function(StudySharedFileBuilder)? updates]) =>
      (new StudySharedFileBuilder()..update(updates))._build();

  _$StudySharedFile._({this.id, this.name, this.description}) : super._();

  @override
  StudySharedFile rebuild(void Function(StudySharedFileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudySharedFileBuilder toBuilder() =>
      new StudySharedFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudySharedFile &&
        id == other.id &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudySharedFile')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class StudySharedFileBuilder
    implements Builder<StudySharedFile, StudySharedFileBuilder> {
  _$StudySharedFile? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  StudySharedFileBuilder() {
    StudySharedFile._defaults(this);
  }

  StudySharedFileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudySharedFile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudySharedFile;
  }

  @override
  void update(void Function(StudySharedFileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudySharedFile build() => _build();

  _$StudySharedFile _build() {
    final _$result = _$v ??
        new _$StudySharedFile._(id: id, name: name, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
