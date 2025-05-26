// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Provider extends Provider {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? logoUri;
  @override
  final String? contactInformation;
  @override
  final String? verifiableCredential;
  @override
  final String? providerUrl;
  @override
  final String? publicKey;

  factory _$Provider([void Function(ProviderBuilder)? updates]) =>
      (new ProviderBuilder()..update(updates))._build();

  _$Provider._(
      {this.id,
      this.name,
      this.description,
      this.logoUri,
      this.contactInformation,
      this.verifiableCredential,
      this.providerUrl,
      this.publicKey})
      : super._();

  @override
  Provider rebuild(void Function(ProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderBuilder toBuilder() => new ProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Provider &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        logoUri == other.logoUri &&
        contactInformation == other.contactInformation &&
        verifiableCredential == other.verifiableCredential &&
        providerUrl == other.providerUrl &&
        publicKey == other.publicKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, logoUri.hashCode);
    _$hash = $jc(_$hash, contactInformation.hashCode);
    _$hash = $jc(_$hash, verifiableCredential.hashCode);
    _$hash = $jc(_$hash, providerUrl.hashCode);
    _$hash = $jc(_$hash, publicKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Provider')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('logoUri', logoUri)
          ..add('contactInformation', contactInformation)
          ..add('verifiableCredential', verifiableCredential)
          ..add('providerUrl', providerUrl)
          ..add('publicKey', publicKey))
        .toString();
  }
}

class ProviderBuilder implements Builder<Provider, ProviderBuilder> {
  _$Provider? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _logoUri;
  String? get logoUri => _$this._logoUri;
  set logoUri(String? logoUri) => _$this._logoUri = logoUri;

  String? _contactInformation;
  String? get contactInformation => _$this._contactInformation;
  set contactInformation(String? contactInformation) =>
      _$this._contactInformation = contactInformation;

  String? _verifiableCredential;
  String? get verifiableCredential => _$this._verifiableCredential;
  set verifiableCredential(String? verifiableCredential) =>
      _$this._verifiableCredential = verifiableCredential;

  String? _providerUrl;
  String? get providerUrl => _$this._providerUrl;
  set providerUrl(String? providerUrl) => _$this._providerUrl = providerUrl;

  String? _publicKey;
  String? get publicKey => _$this._publicKey;
  set publicKey(String? publicKey) => _$this._publicKey = publicKey;

  ProviderBuilder() {
    Provider._defaults(this);
  }

  ProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _logoUri = $v.logoUri;
      _contactInformation = $v.contactInformation;
      _verifiableCredential = $v.verifiableCredential;
      _providerUrl = $v.providerUrl;
      _publicKey = $v.publicKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Provider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Provider;
  }

  @override
  void update(void Function(ProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Provider build() => _build();

  _$Provider _build() {
    final _$result = _$v ??
        new _$Provider._(
            id: id,
            name: name,
            description: description,
            logoUri: logoUri,
            contactInformation: contactInformation,
            verifiableCredential: verifiableCredential,
            providerUrl: providerUrl,
            publicKey: publicKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
