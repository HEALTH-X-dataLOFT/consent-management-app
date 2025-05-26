//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:dwa_backend_api/src/model/target.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'share_request.g.dart';

/// A request to publish a file for sharing with other non-dataspace apps
///
/// Properties:
/// * [target]
/// * [key]
@BuiltValue()
abstract class ShareRequest
    implements Built<ShareRequest, ShareRequestBuilder> {
  @BuiltValueField(wireName: r'target')
  Target? get target;

  @BuiltValueField(wireName: r'key')
  String? get key;

  ShareRequest._();

  factory ShareRequest([void updates(ShareRequestBuilder b)]) = _$ShareRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShareRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareRequest> get serializer => _$ShareRequestSerializer();
}

class _$ShareRequestSerializer implements PrimitiveSerializer<ShareRequest> {
  @override
  final Iterable<Type> types = const [ShareRequest, _$ShareRequest];

  @override
  final String wireName = r'ShareRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShareRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.target != null) {
      yield r'target';
      yield serializers.serialize(
        object.target,
        specifiedType: const FullType(Target),
      );
    }
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShareRequest object, {
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
    required ShareRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Target),
          ) as Target;
          result.target.replace(valueDes);
          break;
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShareRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareRequestBuilder();
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
