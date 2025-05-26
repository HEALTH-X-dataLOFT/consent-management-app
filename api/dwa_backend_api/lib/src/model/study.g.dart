// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Study extends Study {
  @override
  final String? id;
  @override
  final Organization? organization;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? descriptionSummary;
  @override
  final String? studyUri;
  @override
  final int? studyStart;
  @override
  final int? studyEnd;
  @override
  final BuiltList<ResearchData>? researchData;

  factory _$Study([void Function(StudyBuilder)? updates]) =>
      (new StudyBuilder()..update(updates))._build();

  _$Study._(
      {this.id,
      this.organization,
      this.name,
      this.description,
      this.descriptionSummary,
      this.studyUri,
      this.studyStart,
      this.studyEnd,
      this.researchData})
      : super._();

  @override
  Study rebuild(void Function(StudyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyBuilder toBuilder() => new StudyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Study &&
        id == other.id &&
        organization == other.organization &&
        name == other.name &&
        description == other.description &&
        descriptionSummary == other.descriptionSummary &&
        studyUri == other.studyUri &&
        studyStart == other.studyStart &&
        studyEnd == other.studyEnd &&
        researchData == other.researchData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, organization.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, descriptionSummary.hashCode);
    _$hash = $jc(_$hash, studyUri.hashCode);
    _$hash = $jc(_$hash, studyStart.hashCode);
    _$hash = $jc(_$hash, studyEnd.hashCode);
    _$hash = $jc(_$hash, researchData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Study')
          ..add('id', id)
          ..add('organization', organization)
          ..add('name', name)
          ..add('description', description)
          ..add('descriptionSummary', descriptionSummary)
          ..add('studyUri', studyUri)
          ..add('studyStart', studyStart)
          ..add('studyEnd', studyEnd)
          ..add('researchData', researchData))
        .toString();
  }
}

class StudyBuilder implements Builder<Study, StudyBuilder> {
  _$Study? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  OrganizationBuilder? _organization;
  OrganizationBuilder get organization =>
      _$this._organization ??= new OrganizationBuilder();
  set organization(OrganizationBuilder? organization) =>
      _$this._organization = organization;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _descriptionSummary;
  String? get descriptionSummary => _$this._descriptionSummary;
  set descriptionSummary(String? descriptionSummary) =>
      _$this._descriptionSummary = descriptionSummary;

  String? _studyUri;
  String? get studyUri => _$this._studyUri;
  set studyUri(String? studyUri) => _$this._studyUri = studyUri;

  int? _studyStart;
  int? get studyStart => _$this._studyStart;
  set studyStart(int? studyStart) => _$this._studyStart = studyStart;

  int? _studyEnd;
  int? get studyEnd => _$this._studyEnd;
  set studyEnd(int? studyEnd) => _$this._studyEnd = studyEnd;

  ListBuilder<ResearchData>? _researchData;
  ListBuilder<ResearchData> get researchData =>
      _$this._researchData ??= new ListBuilder<ResearchData>();
  set researchData(ListBuilder<ResearchData>? researchData) =>
      _$this._researchData = researchData;

  StudyBuilder() {
    Study._defaults(this);
  }

  StudyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _organization = $v.organization?.toBuilder();
      _name = $v.name;
      _description = $v.description;
      _descriptionSummary = $v.descriptionSummary;
      _studyUri = $v.studyUri;
      _studyStart = $v.studyStart;
      _studyEnd = $v.studyEnd;
      _researchData = $v.researchData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Study other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Study;
  }

  @override
  void update(void Function(StudyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Study build() => _build();

  _$Study _build() {
    _$Study _$result;
    try {
      _$result = _$v ??
          new _$Study._(
              id: id,
              organization: _organization?.build(),
              name: name,
              description: description,
              descriptionSummary: descriptionSummary,
              studyUri: studyUri,
              studyStart: studyStart,
              studyEnd: studyEnd,
              researchData: _researchData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organization';
        _organization?.build();

        _$failedField = 'researchData';
        _researchData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Study', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
