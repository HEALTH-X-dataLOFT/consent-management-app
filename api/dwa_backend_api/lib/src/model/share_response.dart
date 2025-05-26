//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'share_response.g.dart';

/// A response containing the additional information needed to download the shared file
///
/// Properties:
/// * [ttl]
/// * [downloadUri]
/// * [bearerToken]
@BuiltValue()
abstract class ShareResponse
    implements Built<ShareResponse, ShareResponseBuilder> {
  @BuiltValueField(wireName: r'ttl')
  int? get ttl;

  @BuiltValueField(wireName: r'download_uri')
  String? get downloadUri;

  @BuiltValueField(wireName: r'bearer_token')
  String? get bearerToken;

  ShareResponse._();

  factory ShareResponse([void updates(ShareResponseBuilder b)]) =
      _$ShareResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShareResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareResponse> get serializer =>
      _$ShareResponseSerializer();
}

class _$ShareResponseSerializer implements PrimitiveSerializer<ShareResponse> {
  @override
  final Iterable<Type> types = const [ShareResponse, _$ShareResponse];

  @override
  final String wireName = r'ShareResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShareResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ttl != null) {
      yield r'ttl';
      yield serializers.serialize(
        object.ttl,
        specifiedType: const FullType(int),
      );
    }
    if (object.downloadUri != null) {
      yield r'download_uri';
      yield serializers.serialize(
        object.downloadUri,
        specifiedType: const FullType(String),
      );
    }
    if (object.bearerToken != null) {
      yield r'bearer_token';
      yield serializers.serialize(
        object.bearerToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShareResponse object, {
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
    required ShareResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ttl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ttl = valueDes;
          break;
        case r'download_uri':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.downloadUri = valueDes;
          break;
        case r'bearer_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.bearerToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShareResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareResponseBuilder();
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
