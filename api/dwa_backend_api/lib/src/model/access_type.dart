//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'access_type.g.dart';

class AccessType extends EnumClass {
  /// Level of access that a provider has to the resource
  @BuiltValueEnumConst(wireNumber: 0)
  static const AccessType full = _$full;

  /// Level of access that a provider has to the resource
  @BuiltValueEnumConst(wireNumber: 1)
  static const AccessType pseudonymized = _$pseudonymized;

  /// Level of access that a provider has to the resource
  @BuiltValueEnumConst(wireNumber: 2, fallback: true)
  static const AccessType anonymized = _$anonymized;

  static Serializer<AccessType> get serializer => _$accessTypeSerializer;

  const AccessType._(String name) : super(name);

  static BuiltSet<AccessType> get values => _$values;
  static AccessType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AccessTypeMixin = Object with _$AccessTypeMixin;
