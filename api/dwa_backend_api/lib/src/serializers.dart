//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:dwa_backend_api/src/date_serializer.dart';
import 'package:dwa_backend_api/src/model/date.dart';

import 'package:dwa_backend_api/src/model/access_type.dart';
import 'package:dwa_backend_api/src/model/api_provider_file.dart';
import 'package:dwa_backend_api/src/model/download_credentials.dart';
import 'package:dwa_backend_api/src/model/organization.dart';
import 'package:dwa_backend_api/src/model/policy.dart';
import 'package:dwa_backend_api/src/model/policy_request.dart';
import 'package:dwa_backend_api/src/model/provider.dart';
import 'package:dwa_backend_api/src/model/research_data.dart';
import 'package:dwa_backend_api/src/model/share_request.dart';
import 'package:dwa_backend_api/src/model/share_response.dart';
import 'package:dwa_backend_api/src/model/study.dart';
import 'package:dwa_backend_api/src/model/study_shared_file.dart';
import 'package:dwa_backend_api/src/model/target.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccessType,
  ApiProviderFile,
  DownloadCredentials,
  Organization,
  Policy,
  PolicyRequest,
  Provider,
  ResearchData,
  ShareRequest,
  ShareResponse,
  Study,
  StudySharedFile,
  Target,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Provider)]),
        () => ListBuilder<Provider>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ApiProviderFile)]),
        () => ListBuilder<ApiProviderFile>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Policy)]),
        () => ListBuilder<Policy>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Study)]),
        () => ListBuilder<Study>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(StudySharedFile)]),
        () => ListBuilder<StudySharedFile>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
