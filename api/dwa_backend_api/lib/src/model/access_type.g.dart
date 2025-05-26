// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccessType _$full = const AccessType._('full');
const AccessType _$pseudonymized = const AccessType._('pseudonymized');
const AccessType _$anonymized = const AccessType._('anonymized');

AccessType _$valueOf(String name) {
  switch (name) {
    case 'full':
      return _$full;
    case 'pseudonymized':
      return _$pseudonymized;
    case 'anonymized':
      return _$anonymized;
    default:
      return _$anonymized;
  }
}

final BuiltSet<AccessType> _$values =
    new BuiltSet<AccessType>(const <AccessType>[
  _$full,
  _$pseudonymized,
  _$anonymized,
]);

class _$AccessTypeMeta {
  const _$AccessTypeMeta();
  AccessType get full => _$full;
  AccessType get pseudonymized => _$pseudonymized;
  AccessType get anonymized => _$anonymized;
  AccessType valueOf(String name) => _$valueOf(name);
  BuiltSet<AccessType> get values => _$values;
}

abstract class _$AccessTypeMixin {
  // ignore: non_constant_identifier_names
  _$AccessTypeMeta get AccessType => const _$AccessTypeMeta();
}

Serializer<AccessType> _$accessTypeSerializer = new _$AccessTypeSerializer();

class _$AccessTypeSerializer implements PrimitiveSerializer<AccessType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'full': 0,
    'pseudonymized': 1,
    'anonymized': 2,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'full',
    1: 'pseudonymized',
    2: 'anonymized',
  };

  @override
  final Iterable<Type> types = const <Type>[AccessType];
  @override
  final String wireName = 'AccessType';

  @override
  Object serialize(Serializers serializers, AccessType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccessType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccessType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
