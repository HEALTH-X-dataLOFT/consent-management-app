//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:dwa_backend_api/src/model/provider.dart';
import 'package:dwa_backend_api/src/model/api_provider_file.dart';
import 'package:dwa_backend_api/src/model/access_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'policy.g.dart';

/// A policy describing the permission given to a provider for accessing a resource
///
/// Properties:
/// * [id]
/// * [target]
/// * [assignee]
/// * [accessType]
@BuiltValue()
abstract class Policy implements Built<Policy, PolicyBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'target')
  ApiProviderFile? get target;

  @BuiltValueField(wireName: r'assignee')
  Provider? get assignee;

  @BuiltValueField(wireName: r'access_type')
  AccessType? get accessType;
  // enum accessTypeEnum {  0,  1,  2,  };

  Policy._();

  factory Policy([void updates(PolicyBuilder b)]) = _$Policy;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PolicyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Policy> get serializer => _$PolicySerializer();
}

class _$PolicySerializer implements PrimitiveSerializer<Policy> {
  @override
  final Iterable<Type> types = const [Policy, _$Policy];

  @override
  final String wireName = r'Policy';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Policy object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.target != null) {
      yield r'target';
      yield serializers.serialize(
        object.target,
        specifiedType: const FullType(ApiProviderFile),
      );
    }
    if (object.assignee != null) {
      yield r'assignee';
      yield serializers.serialize(
        object.assignee,
        specifiedType: const FullType(Provider),
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
    Policy object, {
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
    required PolicyBuilder result,
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
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ApiProviderFile),
          ) as ApiProviderFile;
          result.target.replace(valueDes);
          break;
        case r'assignee':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Provider),
          ) as Provider;
          result.assignee.replace(valueDes);
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
  Policy deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PolicyBuilder();
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
