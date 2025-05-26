// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PolicyRequest extends PolicyRequest {
  @override
  final Target? target;
  @override
  final String? assignee;
  @override
  final AccessType? accessType;

  factory _$PolicyRequest([void Function(PolicyRequestBuilder)? updates]) =>
      (new PolicyRequestBuilder()..update(updates))._build();

  _$PolicyRequest._({this.target, this.assignee, this.accessType}) : super._();

  @override
  PolicyRequest rebuild(void Function(PolicyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PolicyRequestBuilder toBuilder() => new PolicyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PolicyRequest &&
        target == other.target &&
        assignee == other.assignee &&
        accessType == other.accessType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, target.hashCode);
    _$hash = $jc(_$hash, assignee.hashCode);
    _$hash = $jc(_$hash, accessType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PolicyRequest')
          ..add('target', target)
          ..add('assignee', assignee)
          ..add('accessType', accessType))
        .toString();
  }
}

class PolicyRequestBuilder
    implements Builder<PolicyRequest, PolicyRequestBuilder> {
  _$PolicyRequest? _$v;

  TargetBuilder? _target;
  TargetBuilder get target => _$this._target ??= new TargetBuilder();
  set target(TargetBuilder? target) => _$this._target = target;

  String? _assignee;
  String? get assignee => _$this._assignee;
  set assignee(String? assignee) => _$this._assignee = assignee;

  AccessType? _accessType;
  AccessType? get accessType => _$this._accessType;
  set accessType(AccessType? accessType) => _$this._accessType = accessType;

  PolicyRequestBuilder() {
    PolicyRequest._defaults(this);
  }

  PolicyRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _target = $v.target?.toBuilder();
      _assignee = $v.assignee;
      _accessType = $v.accessType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PolicyRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PolicyRequest;
  }

  @override
  void update(void Function(PolicyRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PolicyRequest build() => _build();

  _$PolicyRequest _build() {
    _$PolicyRequest _$result;
    try {
      _$result = _$v ??
          new _$PolicyRequest._(
              target: _target?.build(),
              assignee: assignee,
              accessType: accessType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'target';
        _target?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PolicyRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
