//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_credentials.g.dart';

/// Credentials and location of file to download
///
/// Properties:
/// * [authenticationType]
/// * [url]
/// * [username]
/// * [password]
@BuiltValue()
abstract class DownloadCredentials
    implements Built<DownloadCredentials, DownloadCredentialsBuilder> {
  @BuiltValueField(wireName: r'authentication_type')
  DownloadCredentialsAuthenticationTypeEnum? get authenticationType;
  // enum authenticationTypeEnum {  0,  1,  2,  };

  @BuiltValueField(wireName: r'url')
  String? get url;

  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'password')
  String? get password;

  DownloadCredentials._();

  factory DownloadCredentials([void updates(DownloadCredentialsBuilder b)]) =
      _$DownloadCredentials;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadCredentialsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadCredentials> get serializer =>
      _$DownloadCredentialsSerializer();
}

class _$DownloadCredentialsSerializer
    implements PrimitiveSerializer<DownloadCredentials> {
  @override
  final Iterable<Type> types = const [
    DownloadCredentials,
    _$DownloadCredentials
  ];

  @override
  final String wireName = r'DownloadCredentials';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadCredentials object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.authenticationType != null) {
      yield r'authentication_type';
      yield serializers.serialize(
        object.authenticationType,
        specifiedType:
            const FullType(DownloadCredentialsAuthenticationTypeEnum),
      );
    }
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType(String),
      );
    }
    if (object.username != null) {
      yield r'username';
      yield serializers.serialize(
        object.username,
        specifiedType: const FullType(String),
      );
    }
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadCredentials object, {
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
    required DownloadCredentialsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'authentication_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(DownloadCredentialsAuthenticationTypeEnum),
          ) as DownloadCredentialsAuthenticationTypeEnum;
          result.authenticationType = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DownloadCredentials deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadCredentialsBuilder();
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

class DownloadCredentialsAuthenticationTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 0)
  static const DownloadCredentialsAuthenticationTypeEnum unspecified =
      _$downloadCredentialsAuthenticationTypeEnum_unspecified;
  @BuiltValueEnumConst(wireNumber: 1)
  static const DownloadCredentialsAuthenticationTypeEnum bearer_token =
      _$downloadCredentialsAuthenticationTypeEnum_bearer_token;
  @BuiltValueEnumConst(wireNumber: 2, fallback: true)
  static const DownloadCredentialsAuthenticationTypeEnum basic_auth =
      _$downloadCredentialsAuthenticationTypeEnum_basic_auth;

  static Serializer<DownloadCredentialsAuthenticationTypeEnum> get serializer =>
      _$downloadCredentialsAuthenticationTypeEnumSerializer;

  const DownloadCredentialsAuthenticationTypeEnum._(String name) : super(name);

  static BuiltSet<DownloadCredentialsAuthenticationTypeEnum> get values =>
      _$downloadCredentialsAuthenticationTypeEnumValues;
  static DownloadCredentialsAuthenticationTypeEnum valueOf(String name) =>
      _$downloadCredentialsAuthenticationTypeEnumValueOf(name);
}
