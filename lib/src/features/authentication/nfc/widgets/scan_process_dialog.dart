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

import 'package:consent_management_app/src/common/theme/extension.dart';
import 'package:flutter/material.dart';

class ScanProcessDialog extends StatefulWidget {
  const ScanProcessDialog({
    required this.errorTitle,
    required this.errorConfirmButtonText,
    required this.errorCancelButtonText,
    required this.successTitle,
    required this.onClose,
    super.key,
  });

  final String successTitle;
  final String errorTitle;
  final String errorConfirmButtonText;
  final String errorCancelButtonText;
  final VoidCallback onClose;

  @override
  State<ScanProcessDialog> createState() => _ScanProcessDialogState();
}

class _ScanProcessDialogState extends State<ScanProcessDialog> {
  bool isLoading = false;
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    hasError = false;
  }

  void confirm() {
    setState(() {
      hasError = false;
      isLoading = true;
    });
  }

  void cancel() {
    setState(() {
      hasError = false;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 310,
        maxWidth: 332,
      ),
      child: Card(
        color: context.colorScheme.primaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: widget.onClose,
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              if (isLoading && !hasError)
                ScanProcessLoading(
                  title: widget.successTitle,
                ),
              if (hasError)
                ScanProcessError(
                  onConfirm: confirm,
                  onCancel: cancel,
                  title: widget.errorTitle,
                  confirmButtonText: widget.errorConfirmButtonText,
                  cancelButtonText: widget.errorCancelButtonText,
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanProcessLoading extends StatelessWidget {
  const ScanProcessLoading({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 83,
              width: 83,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                strokeCap: StrokeCap.round,
                backgroundColor: context.colorScheme.primaryFixed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ScanProcessError extends StatelessWidget {
  const ScanProcessError({
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    required this.confirmButtonText,
    required this.cancelButtonText,
    super.key,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String confirmButtonText;
  final String cancelButtonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.close,
              color: context.colorScheme.error,
              size: 60,
            ),
            SizedBox(
              height: 83,
              width: 83,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                strokeCap: StrokeCap.round,
                value: 0.0,
                backgroundColor: context.colorScheme.primaryFixed,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          width: 201,
          child: FilledButton(
            onPressed: onConfirm,
            child: Text(
              confirmButtonText,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          width: 201,
          child: OutlinedButton(
            onPressed: onCancel,
            child: Text(
              cancelButtonText,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
