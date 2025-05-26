//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:dwa_backend_api/src/model/target.dart';
import 'package:dwa_backend_api/src/model/access_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'policy_request.g.dart';

/// A policy permission request to set access permissions for a provider to a resource
///
/// Properties:
/// * [target]
/// * [assignee]
/// * [accessType]
@BuiltValue()
abstract class PolicyRequest
    implements Built<PolicyRequest, PolicyRequestBuilder> {
  @BuiltValueField(wireName: r'target')
  Target? get target;

  @BuiltValueField(wireName: r'assignee')
  String? get assignee;

  @BuiltValueField(wireName: r'access_type')
  AccessType? get accessType;
  // enum accessTypeEnum {  0,  1,  2,  };

  PolicyRequest._();

  factory PolicyRequest([void updates(PolicyRequestBuilder b)]) =
      _$PolicyRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PolicyRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PolicyRequest> get serializer =>
      _$PolicyRequestSerializer();
}

class _$PolicyRequestSerializer implements PrimitiveSerializer<PolicyRequest> {
  @override
  final Iterable<Type> types = const [PolicyRequest, _$PolicyRequest];

  @override
  final String wireName = r'PolicyRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PolicyRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.target != null) {
      yield r'target';
      yield serializers.serialize(
        object.target,
        specifiedType: const FullType(Target),
      );
    }
    if (object.assignee != null) {
      yield r'assignee';
      yield serializers.serialize(
        object.assignee,
        specifiedType: const FullType(String),
      );
    }
    if (object.accessType != null) {
      yield r'access_type';
      yield serializers.serialize(
        object.accessType,
        specifiedType: const FullType(AccessType),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PolicyRequest object, {
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
    required PolicyRequestBuilder result,
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
        case r'assignee':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assignee = valueDes;
          break;
        case r'access_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccessType),
          ) as AccessType;
          result.accessType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PolicyRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PolicyRequestBuilder();
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
