// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShareRequest extends ShareRequest {
  @override
  final Target? target;
  @override
  final String? key;

  factory _$ShareRequest([void Function(ShareRequestBuilder)? updates]) =>
      (new ShareRequestBuilder()..update(updates))._build();

  _$ShareRequest._({this.target, this.key}) : super._();

  @override
  ShareRequest rebuild(void Function(ShareRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShareRequestBuilder toBuilder() => new ShareRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShareRequest && target == other.target && key == other.key;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, target.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShareRequest')
          ..add('target', target)
          ..add('key', key))
        .toString();
  }
}

class ShareRequestBuilder
    implements Builder<ShareRequest, ShareRequestBuilder> {
  _$ShareRequest? _$v;

  TargetBuilder? _target;
  TargetBuilder get target => _$this._target ??= new TargetBuilder();
  set target(TargetBuilder? target) => _$this._target = target;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ShareRequestBuilder() {
    ShareRequest._defaults(this);
  }

  ShareRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _target = $v.target?.toBuilder();
      _key = $v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShareRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShareRequest;
  }

  @override
  void update(void Function(ShareRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShareRequest build() => _build();

  _$ShareRequest _build() {
    _$ShareRequest _$result;
    try {
      _$result =
          _$v ?? new _$ShareRequest._(target: _target?.build(), key: key);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'target';
        _target?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShareRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
