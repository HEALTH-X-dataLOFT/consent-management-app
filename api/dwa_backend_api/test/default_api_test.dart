import 'package:test/test.dart';
import 'package:dwa_backend_api/dwa_backend_api.dart';

/// tests for DefaultApi
void main() {
  final instance = DwaBackendApi().getDefaultApi();

  group(DefaultApi, () {
    // Get the the list of policy permissions given to providers for accessing your data
    //
    //Future<BuiltList<Policy>> apiPoliciesGet() async
    test('test apiPoliciesGet', () async {
      // TODO
    });

    // Delete a policy permission given its id
    //
    //Future apiPoliciesPolicyIdDelete(String policyId) async
    test('test apiPoliciesPolicyIdDelete', () async {
      // TODO
    });

    // Create a new policy permission for a provider to access your data
    //
    //Future apiPoliciesPost({ PolicyRequest policyRequest }) async
    test('test apiPoliciesPost', () async {
      // TODO
    });

    // Get providers
    //
    //Future<BuiltList<Provider>> apiProvidersGet() async
    test('test apiProvidersGet', () async {
      // TODO
    });

    // Download a file from provider given provider_id and file_id
    //
    //Future<Uint8List> apiProvidersProviderIdFilesFileIdGet(String providerId, String fileId) async
    test('test apiProvidersProviderIdFilesFileIdGet', () async {
      // TODO
    });

    // Get the the list of your files hosted by provider
    //
    //Future<BuiltList<File>> apiProvidersProviderIdFilesGet(String providerId) async
    test('test apiProvidersProviderIdFilesGet', () async {
      // TODO
    });

    // Publish a file for sharing with other non-dataspace apps
    //
    //Future<ShareResponse> apiSharesPost({ ShareRequest shareRequest }) async
    test('test apiSharesPost', () async {
      // TODO
    });
  });
}
