///  ```dart
/// Copyright 2025 HEALTH-X dataLOFT
///
/// Licensed under the European Union Public Licence, Version 1.2 (the
/// "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     https://eupl.eu/1.2/en/
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

library;

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A service for monitoring device connectivity and internet availability.
///
/// Uses [Connectivity] to discover network connectivity configurations and
/// [InternetAddress.lookup] to check internet availability.
///
/// This service provides [ConnectivityState] either as stream that emits real-
/// time connectivity changes or manual checks for the current connectivity.
class ConnectivityService extends GetxService {
  final connectivity = Get.find<Connectivity>();

  /// A stream that emits [ConnectivityState]s whenever a connectivity change
  /// occurs.
  Stream<ConnectivityState> get connectivityStream {
    return connectivity.onConnectivityChanged.asyncMap<ConnectivityState>(
      _convertConnectivityResultToState,
    );
  }

  /// Retrieves the current [ConnectivityState].
  Future<ConnectivityState> checkConnectivity() async {
    return _convertConnectivityResultToState(
      await connectivity.checkConnectivity(),
    );
  }

  Future<ConnectivityState> _convertConnectivityResultToState(
    List<ConnectivityResult> connectivityResult,
  ) async {
    return ConnectivityState(
      hasInternet: await _checkInternet(),
      isConnected: _checkConnectivityResult(connectivityResult),
    );
  }

  Future<bool> _checkInternet() async {
    bool hasInternet = false;
    try {
      // performs a DNS lookup to `google.com` to determine if
      // the internet is reachable. This is the easiest way to do it.
      final result = await InternetAddress.lookup('google.com');
      hasInternet = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      hasInternet = false;
    }
    return hasInternet;
  }

  bool _checkConnectivityResult(List<ConnectivityResult> connectivityResult) {
    // checks if the device is connected via **mobile data, Wi-Fi, or ethernet**
    // since this is sufficient for th current app use case.
    return connectivityResult.any(
      (result) => [
        ConnectivityResult.mobile,
        ConnectivityResult.wifi,
        ConnectivityResult.ethernet,
      ].contains(result),
    );
  }
}

/// Represents the current connectivity state.
///
/// This model contains information about whether the device is connected
/// to a network and if the internet is accessible.
/// - [isConnected]: Whether the device has an active network connection.
/// - [hasInternet]: Whether the device can access the internet.
@immutable
class ConnectivityState {
  final bool isConnected;
  final bool hasInternet;

  const ConnectivityState({
    required this.isConnected,
    required this.hasInternet,
  });
}
