# dwa_backend_api.api.DefaultApi

## Load the API package
```dart
import 'package:dwa_backend_api/api.dart';
```

All URIs are relative to *https://api.server.test/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiPoliciesGet**](DefaultApi.md#apipoliciesget) | **GET** /api/policies | Get the the list of policy permissions given to providers for accessing your data
[**apiPoliciesPolicyIdDelete**](DefaultApi.md#apipoliciespolicyiddelete) | **DELETE** /api/policies/{policy_id} | Delete a policy permission given its id
[**apiPoliciesPost**](DefaultApi.md#apipoliciespost) | **POST** /api/policies | Create a new policy permission for a provider to access your data
[**apiProvidersGet**](DefaultApi.md#apiprovidersget) | **GET** /api/providers | Get providers
[**apiProvidersProviderIdFilesGet**](DefaultApi.md#apiprovidersprovideridfilesget) | **GET** /api/providers/{provider_id}/files | Get the the list of your files hosted by provider
[**apiProvidersProviderIdFilesProviderFileIdCredentialsGet**](DefaultApi.md#apiprovidersprovideridfilesproviderfileidcredentialsget) | **GET** /api/providers/{provider_id}/files/{provider_file_id}/credentials | Retrieve credentials for downloading a file from provider given provider_id and provider_file_id
[**apiProvidersProviderIdFilesProviderFileIdGet**](DefaultApi.md#apiprovidersprovideridfilesproviderfileidget) | **GET** /api/providers/{provider_id}/files/{provider_file_id} | Download a file from provider given provider_id and provider_file_id
[**apiSharesPost**](DefaultApi.md#apisharespost) | **POST** /api/shares | Publish a file for sharing with other non-dataspace apps
[**apiStudiesGet**](DefaultApi.md#apistudiesget) | **GET** /api/studies | Get the the list of studies available to participate in
[**apiStudiesStudyIdFilesGet**](DefaultApi.md#apistudiesstudyidfilesget) | **GET** /api/studies/{study_id}/files | Get the the list of files available to share with a given study
[**apiStudiesStudyIdGet**](DefaultApi.md#apistudiesstudyidget) | **GET** /api/studies/{study_id} | Get the details of a study given its id
[**apiStudiesStudyIdPost**](DefaultApi.md#apistudiesstudyidpost) | **POST** /api/studies/{study_id} | Send the list of files you want to share with a given study


# **apiPoliciesGet**
> BuiltList<Policy> apiPoliciesGet()

Get the the list of policy permissions given to providers for accessing your data

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();

try {
    final response = api.apiPoliciesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiPoliciesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Policy&gt;**](Policy.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPoliciesPolicyIdDelete**
> apiPoliciesPolicyIdDelete(policyId)

Delete a policy permission given its id

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String policyId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The policy id

try {
    api.apiPoliciesPolicyIdDelete(policyId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiPoliciesPolicyIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **policyId** | **String**| The policy id | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPoliciesPost**
> apiPoliciesPost(policyRequest)

Create a new policy permission for a provider to access your data

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final PolicyRequest policyRequest = ; // PolicyRequest | 

try {
    api.apiPoliciesPost(policyRequest);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiPoliciesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **policyRequest** | [**PolicyRequest**](PolicyRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProvidersGet**
> BuiltList<Provider> apiProvidersGet()

Get providers

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();

try {
    final response = api.apiProvidersGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiProvidersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Provider&gt;**](Provider.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProvidersProviderIdFilesGet**
> BuiltList<ApiProviderFile> apiProvidersProviderIdFilesGet(providerId)

Get the the list of your files hosted by provider

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String providerId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The provider id

try {
    final response = api.apiProvidersProviderIdFilesGet(providerId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiProvidersProviderIdFilesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerId** | **String**| The provider id | 

### Return type

[**BuiltList&lt;ApiProviderFile&gt;**](ApiProviderFile.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProvidersProviderIdFilesProviderFileIdCredentialsGet**
> DownloadCredentials apiProvidersProviderIdFilesProviderFileIdCredentialsGet(providerId, providerFileId)

Retrieve credentials for downloading a file from provider given provider_id and provider_file_id

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String providerId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The provider id
final String providerFileId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The file id

try {
    final response = api.apiProvidersProviderIdFilesProviderFileIdCredentialsGet(providerId, providerFileId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiProvidersProviderIdFilesProviderFileIdCredentialsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerId** | **String**| The provider id | 
 **providerFileId** | **String**| The file id | 

### Return type

[**DownloadCredentials**](DownloadCredentials.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProvidersProviderIdFilesProviderFileIdGet**
> Uint8List apiProvidersProviderIdFilesProviderFileIdGet(providerId, providerFileId)

Download a file from provider given provider_id and provider_file_id

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String providerId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The provider id
final String providerFileId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The file id

try {
    final response = api.apiProvidersProviderIdFilesProviderFileIdGet(providerId, providerFileId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiProvidersProviderIdFilesProviderFileIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerId** | **String**| The provider id | 
 **providerFileId** | **String**| The file id | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiSharesPost**
> ShareResponse apiSharesPost(shareRequest)

Publish a file for sharing with other non-dataspace apps

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final ShareRequest shareRequest = ; // ShareRequest | 

try {
    final response = api.apiSharesPost(shareRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiSharesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shareRequest** | [**ShareRequest**](ShareRequest.md)|  | [optional] 

### Return type

[**ShareResponse**](ShareResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStudiesGet**
> BuiltList<Study> apiStudiesGet()

Get the the list of studies available to participate in

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();

try {
    final response = api.apiStudiesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiStudiesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Study&gt;**](Study.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStudiesStudyIdFilesGet**
> BuiltList<ApiProviderFile> apiStudiesStudyIdFilesGet(studyId)

Get the the list of files available to share with a given study

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String studyId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The study id

try {
    final response = api.apiStudiesStudyIdFilesGet(studyId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiStudiesStudyIdFilesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studyId** | **String**| The study id | 

### Return type

[**BuiltList&lt;ApiProviderFile&gt;**](ApiProviderFile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStudiesStudyIdGet**
> Study apiStudiesStudyIdGet(studyId)

Get the details of a study given its id

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String studyId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The study id

try {
    final response = api.apiStudiesStudyIdGet(studyId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiStudiesStudyIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studyId** | **String**| The study id | 

### Return type

[**Study**](Study.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStudiesStudyIdPost**
> BuiltList<StudySharedFile> apiStudiesStudyIdPost(studyId, apiProviderFile)

Send the list of files you want to share with a given study

### Example
```dart
import 'package:dwa_backend_api/api.dart';

final api = DwaBackendApi().getDefaultApi();
final String studyId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The study id
final BuiltList<ApiProviderFile> apiProviderFile = ; // BuiltList<ApiProviderFile> | 

try {
    final response = api.apiStudiesStudyIdPost(studyId, apiProviderFile);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->apiStudiesStudyIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studyId** | **String**| The study id | 
 **apiProviderFile** | [**BuiltList&lt;ApiProviderFile&gt;**](ApiProviderFile.md)|  | [optional] 

### Return type

[**BuiltList&lt;StudySharedFile&gt;**](StudySharedFile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

