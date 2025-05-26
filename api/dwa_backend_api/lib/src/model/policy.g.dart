// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Policy extends Policy {
  @override
  final String? id;
  @override
  final ApiProviderFile? target;
  @override
  final Provider? assignee;
  @override
  final AccessType? accessType;

  factory _$Policy([void Function(PolicyBuilder)? updates]) =>
      (new PolicyBuilder()..update(updates))._build();

  _$Policy._({this.id, this.target, this.assignee, this.accessType})
      : super._();

  @override
  Policy rebuild(void Function(PolicyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PolicyBuilder toBuilder() => new PolicyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Policy &&
        id == other.id &&
        target == other.target &&
        assignee == other.assignee &&
        accessType == other.accessType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, target.hashCode);
    _$hash = $jc(_$hash, assignee.hashCode);
    _$hash = $jc(_$hash, accessType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Policy')
          ..add('id', id)
          ..add('target', target)
          ..add('assignee', assignee)
          ..add('accessType', accessType))
        .toString();
  }
}

class PolicyBuilder implements Builder<Policy, PolicyBuilder> {
  _$Policy? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ApiProviderFileBuilder? _target;
  ApiProviderFileBuilder get target =>
      _$this._target ??= new ApiProviderFileBuilder();
  set target(ApiProviderFileBuilder? target) => _$this._target = target;

  ProviderBuilder? _assignee;
  ProviderBuilder get assignee => _$this._assignee ??= new ProviderBuilder();
  set assignee(ProviderBuilder? assignee) => _$this._assignee = assignee;

  AccessType? _accessType;
  AccessType? get accessType => _$this._accessType;
  set accessType(AccessType? accessType) => _$this._accessType = accessType;

  PolicyBuilder() {
    Policy._defaults(this);
  }

  PolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _target = $v.target?.toBuilder();
      _assignee = $v.assignee?.toBuilder();
      _accessType = $v.accessType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Policy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Policy;
  }

  @override
  void update(void Function(PolicyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Policy build() => _build();

  _$Policy _build() {
    _$Policy _$result;
    try {
      _$result = _$v ??
          new _$Policy._(
              id: id,
              target: _target?.build(),
              assignee: _assignee?.build(),
              accessType: accessType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'target';
        _target?.build();
        _$failedField = 'assignee';
        _assignee?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Policy', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
