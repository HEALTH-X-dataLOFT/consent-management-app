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

import 'package:consent_management_app/src/common/models/provider_file_download.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:open_filex/open_filex.dart';

final _logger = Logger();

extension ProviderFileDownloadOpen on ProviderFileDownload {
  FutureOr<void> open() async {
    final path = await getTmpFilePath();
    if (path == null) {
      Fluttertoast.showToast(
        msg: "No file found",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      return;
    }
    final OpenResult result = await OpenFilex.open(path, type: contentType);
    _logger.d("Open result: ${result.message}, ${result.type}");
  }
}
