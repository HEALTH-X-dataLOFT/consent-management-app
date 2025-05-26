//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:dwa_backend_api/src/model/access_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'research_data.g.dart';

/// The ResearchData object identifies a class of wanted research data and required data access type
///
/// Properties:
/// * [name]
/// * [description]
/// * [dataType]
/// * [accessType]
@BuiltValue()
abstract class ResearchData
    implements Built<ResearchData, ResearchDataBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'data_type')
  String? get dataType;

  @BuiltValueField(wireName: r'access_type')
  AccessType? get accessType;
  // enum accessTypeEnum {  0,  1,  2,  };

  ResearchData._();

  factory ResearchData([void updates(ResearchDataBuilder b)]) = _$ResearchData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResearchDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResearchData> get serializer => _$ResearchDataSerializer();
}

class _$ResearchDataSerializer implements PrimitiveSerializer<ResearchData> {
  @override
  final Iterable<Type> types = const [ResearchData, _$ResearchData];

  @override
  final String wireName = r'ResearchData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResearchData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.dataType != null) {
      yield r'data_type';
      yield serializers.serialize(
        object.dataType,
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
    ResearchData object, {
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
    required ResearchDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'data_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dataType = valueDes;
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
  ResearchData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResearchDataBuilder();
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
