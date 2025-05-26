// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_credentials.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DownloadCredentialsAuthenticationTypeEnum
    _$downloadCredentialsAuthenticationTypeEnum_unspecified =
    const DownloadCredentialsAuthenticationTypeEnum._('unspecified');
const DownloadCredentialsAuthenticationTypeEnum
    _$downloadCredentialsAuthenticationTypeEnum_bearer_token =
    const DownloadCredentialsAuthenticationTypeEnum._('bearer_token');
const DownloadCredentialsAuthenticationTypeEnum
    _$downloadCredentialsAuthenticationTypeEnum_basic_auth =
    const DownloadCredentialsAuthenticationTypeEnum._('basic_auth');

DownloadCredentialsAuthenticationTypeEnum
    _$downloadCredentialsAuthenticationTypeEnumValueOf(String name) {
  switch (name) {
    case 'unspecified':
      return _$downloadCredentialsAuthenticationTypeEnum_unspecified;
    case 'bearer_token':
      return _$downloadCredentialsAuthenticationTypeEnum_bearer_token;
    case 'basic_auth':
      return _$downloadCredentialsAuthenticationTypeEnum_basic_auth;
    default:
      return _$downloadCredentialsAuthenticationTypeEnum_basic_auth;
  }
}

final BuiltSet<DownloadCredentialsAuthenticationTypeEnum>
    _$downloadCredentialsAuthenticationTypeEnumValues = new BuiltSet<
        DownloadCredentialsAuthenticationTypeEnum>(const <DownloadCredentialsAuthenticationTypeEnum>[
  _$downloadCredentialsAuthenticationTypeEnum_unspecified,
  _$downloadCredentialsAuthenticationTypeEnum_bearer_token,
  _$downloadCredentialsAuthenticationTypeEnum_basic_auth,
]);

Serializer<DownloadCredentialsAuthenticationTypeEnum>
    _$downloadCredentialsAuthenticationTypeEnumSerializer =
    new _$DownloadCredentialsAuthenticationTypeEnumSerializer();

class _$DownloadCredentialsAuthenticationTypeEnumSerializer
    implements PrimitiveSerializer<DownloadCredentialsAuthenticationTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'unspecified': 0,
    'bearer_token': 1,
    'basic_auth': 2,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'unspecified',
    1: 'bearer_token',
    2: 'basic_auth',
  };

  @override
  final Iterable<Type> types = const <Type>[
    DownloadCredentialsAuthenticationTypeEnum
  ];
  @override
  final String wireName = 'DownloadCredentialsAuthenticationTypeEnum';

  @override
  Object serialize(Serializers serializers,
          DownloadCredentialsAuthenticationTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DownloadCredentialsAuthenticationTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DownloadCredentialsAuthenticationTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DownloadCredentials extends DownloadCredentials {
  @override
  final DownloadCredentialsAuthenticationTypeEnum? authenticationType;
  @override
  final String? url;
  @override
  final String? username;
  @override
  final String? password;

  factory _$DownloadCredentials(
          [void Function(DownloadCredentialsBuilder)? updates]) =>
      (new DownloadCredentialsBuilder()..update(updates))._build();

  _$DownloadCredentials._(
      {this.authenticationType, this.url, this.username, this.password})
      : super._();

  @override
  DownloadCredentials rebuild(
          void Function(DownloadCredentialsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DownloadCredentialsBuilder toBuilder() =>
      new DownloadCredentialsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DownloadCredentials &&
        authenticationType == other.authenticationType &&
        url == other.url &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authenticationType.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DownloadCredentials')
          ..add('authenticationType', authenticationType)
          ..add('url', url)
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class DownloadCredentialsBuilder
    implements Builder<DownloadCredentials, DownloadCredentialsBuilder> {
  _$DownloadCredentials? _$v;

  DownloadCredentialsAuthenticationTypeEnum? _authenticationType;
  DownloadCredentialsAuthenticationTypeEnum? get authenticationType =>
      _$this._authenticationType;
  set authenticationType(
          DownloadCredentialsAuthenticationTypeEnum? authenticationType) =>
      _$this._authenticationType = authenticationType;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  DownloadCredentialsBuilder() {
    DownloadCredentials._defaults(this);
  }

  DownloadCredentialsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authenticationType = $v.authenticationType;
      _url = $v.url;
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DownloadCredentials other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DownloadCredentials;
  }

  @override
  void update(void Function(DownloadCredentialsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DownloadCredentials build() => _build();

  _$DownloadCredentials _build() {
    final _$result = _$v ??
        new _$DownloadCredentials._(
            authenticationType: authenticationType,
            url: url,
            username: username,
            password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
