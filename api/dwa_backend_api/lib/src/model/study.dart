//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:dwa_backend_api/src/model/research_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dwa_backend_api/src/model/organization.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'study.g.dart';

/// A representation of a research study
///
/// Properties:
/// * [id]
/// * [organization]
/// * [name]
/// * [description]
/// * [descriptionSummary]
/// * [studyUri]
/// * [studyStart]
/// * [studyEnd]
/// * [researchData]
@BuiltValue()
abstract class Study implements Built<Study, StudyBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'organization')
  Organization? get organization;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'description_summary')
  String? get descriptionSummary;

  @BuiltValueField(wireName: r'study_uri')
  String? get studyUri;

  @BuiltValueField(wireName: r'study_start')
  int? get studyStart;

  @BuiltValueField(wireName: r'study_end')
  int? get studyEnd;

  @BuiltValueField(wireName: r'research_data')
  BuiltList<ResearchData>? get researchData;

  Study._();

  factory Study([void updates(StudyBuilder b)]) = _$Study;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StudyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Study> get serializer => _$StudySerializer();
}

class _$StudySerializer implements PrimitiveSerializer<Study> {
  @override
  final Iterable<Type> types = const [Study, _$Study];

  @override
  final String wireName = r'Study';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Study object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.organization != null) {
      yield r'organization';
      yield serializers.serialize(
        object.organization,
        specifiedType: const FullType(Organization),
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
    if (object.descriptionSummary != null) {
      yield r'description_summary';
      yield serializers.serialize(
        object.descriptionSummary,
        specifiedType: const FullType(String),
      );
    }
    if (object.studyUri != null) {
      yield r'study_uri';
      yield serializers.serialize(
        object.studyUri,
        specifiedType: const FullType(String),
      );
    }
    if (object.studyStart != null) {
      yield r'study_start';
      yield serializers.serialize(
        object.studyStart,
        specifiedType: const FullType(int),
      );
    }
    if (object.studyEnd != null) {
      yield r'study_end';
      yield serializers.serialize(
        object.studyEnd,
        specifiedType: const FullType(int),
      );
    }
    if (object.researchData != null) {
      yield r'research_data';
      yield serializers.serialize(
        object.researchData,
        specifiedType: const FullType(BuiltList, [FullType(ResearchData)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Study object, {
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
    required StudyBuilder result,
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
        case r'organization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Organization),
          ) as Organization;
          result.organization.replace(valueDes);
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
        case r'description_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionSummary = valueDes;
          break;
        case r'study_uri':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.studyUri = valueDes;
          break;
        case r'study_start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.studyStart = valueDes;
          break;
        case r'study_end':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.studyEnd = valueDes;
          break;
        case r'research_data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ResearchData)]),
          ) as BuiltList<ResearchData>;
          result.researchData.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Study deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StudyBuilder();
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
