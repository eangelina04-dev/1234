import 'package:flutter/material.dart';

import 'view_helpers.dart';

class FineSummaryCard extends StatelessWidget {
  const FineSummaryCard({
    super.key,
    required this.totalFine,
    required this.activeCount,
    required this.overdueCount,
    required this.today,
  });

  final int totalFine;
  final int activeCount;
  final int overdueCount;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ringkasan denda', style: text.titleMedium),
            const SizedBox(height: 4),
            Text('Tanggal sistem: ${formatDate(today)}', style: text.bodySmall),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _Stat(label: 'Total tagihan', value: formatRupiah(totalFine)),
                ),
                Expanded(child: _Stat(label: 'Aktif', value: '$activeCount')),
                Expanded(child: _Stat(label: 'Terlambat', value: '$overdueCount')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(value, style: text.titleLarge),
        ),
        Text(label, style: text.bodySmall),
      ],
    );
  }
}