// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShareResponse extends ShareResponse {
  @override
  final int? ttl;
  @override
  final String? downloadUri;
  @override
  final String? bearerToken;

  factory _$ShareResponse([void Function(ShareResponseBuilder)? updates]) =>
      (new ShareResponseBuilder()..update(updates))._build();

  _$ShareResponse._({this.ttl, this.downloadUri, this.bearerToken}) : super._();

  @override
  ShareResponse rebuild(void Function(ShareResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShareResponseBuilder toBuilder() => new ShareResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShareResponse &&
        ttl == other.ttl &&
        downloadUri == other.downloadUri &&
        bearerToken == other.bearerToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ttl.hashCode);
    _$hash = $jc(_$hash, downloadUri.hashCode);
    _$hash = $jc(_$hash, bearerToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShareResponse')
          ..add('ttl', ttl)
          ..add('downloadUri', downloadUri)
          ..add('bearerToken', bearerToken))
        .toString();
  }
}

class ShareResponseBuilder
    implements Builder<ShareResponse, ShareResponseBuilder> {
  _$ShareResponse? _$v;

  int? _ttl;
  int? get ttl => _$this._ttl;
  set ttl(int? ttl) => _$this._ttl = ttl;

  String? _downloadUri;
  String? get downloadUri => _$this._downloadUri;
  set downloadUri(String? downloadUri) => _$this._downloadUri = downloadUri;

  String? _bearerToken;
  String? get bearerToken => _$this._bearerToken;
  set bearerToken(String? bearerToken) => _$this._bearerToken = bearerToken;

  ShareResponseBuilder() {
    ShareResponse._defaults(this);
  }

  ShareResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ttl = $v.ttl;
      _downloadUri = $v.downloadUri;
      _bearerToken = $v.bearerToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShareResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShareResponse;
  }

  @override
  void update(void Function(ShareResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShareResponse build() => _build();

  _$ShareResponse _build() {
    final _$result = _$v ??
        new _$ShareResponse._(
            ttl: ttl, downloadUri: downloadUri, bearerToken: bearerToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
