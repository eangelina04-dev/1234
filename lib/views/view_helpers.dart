import 'package:flutter/material.dart';

import '../viewmodels/operation_result.dart';

String formatRupiah(int amount) {
  final digits = amount.abs().toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write('.');
    buffer.write(digits[i]);
  }
  return 'Rp${amount < 0 ? '-' : ''}$buffer';
}

String formatDate(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/${d.year}';

void showResultSnackBar(BuildContext context, OperationResult result) {
  final scheme = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          result.message,
          style: result.success ? null : TextStyle(color: scheme.onError),
        ),
        backgroundColor: result.success ? null : scheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
}