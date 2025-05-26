//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider.g.dart';

/// A provider of data
///
/// Properties:
/// * [id]
/// * [name]
/// * [description]
/// * [logoUri]
/// * [contactInformation]
/// * [verifiableCredential]
/// * [providerUrl]
/// * [publicKey]
@BuiltValue()
abstract class Provider implements Built<Provider, ProviderBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'logo_uri')
  String? get logoUri;

  @BuiltValueField(wireName: r'contact_information')
  String? get contactInformation;

  @BuiltValueField(wireName: r'verifiable_credential')
  String? get verifiableCredential;

  @BuiltValueField(wireName: r'provider_url')
  String? get providerUrl;

  @BuiltValueField(wireName: r'public_key')
  String? get publicKey;

  Provider._();

  factory Provider([void updates(ProviderBuilder b)]) = _$Provider;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProviderBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Provider> get serializer => _$ProviderSerializer();
}

class _$ProviderSerializer implements PrimitiveSerializer<Provider> {
  @override
  final Iterable<Type> types = const [Provider, _$Provider];

  @override
  final String wireName = r'Provider';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Provider object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.logoUri != null) {
      yield r'logo_uri';
      yield serializers.serialize(
        object.logoUri,
        specifiedType: const FullType(String),
      );
    }
    if (object.contactInformation != null) {
      yield r'contact_information';
      yield serializers.serialize(
        object.contactInformation,
        specifiedType: const FullType(String),
      );
    }
    if (object.verifiableCredential != null) {
      yield r'verifiable_credential';
      yield serializers.serialize(
        object.verifiableCredential,
        specifiedType: const FullType(String),
      );
    }
    if (object.providerUrl != null) {
      yield r'provider_url';
      yield serializers.serialize(
        object.providerUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.publicKey != null) {
      yield r'public_key';
      yield serializers.serialize(
        object.publicKey,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Provider object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProviderBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'logo_uri':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.logoUri = valueDes;
          break;
        case r'contact_information':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contactInformation = valueDes;
          break;
        case r'verifiable_credential':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.verifiableCredential = valueDes;
          break;
        case r'provider_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.providerUrl = valueDes;
          break;
        case r'public_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publicKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Provider deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProviderBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
