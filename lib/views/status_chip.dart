import 'package:flutter/material.dart';

import '../viewmodels/display_status.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status});

  final DisplayStatus status;

  String get _label => switch (status) {
    DisplayStatus.available => 'Tersedia',
    DisplayStatus.borrowed => 'Dipinjam',
    DisplayStatus.overdue => 'Terlambat',
    DisplayStatus.missing => 'Hilang',
    DisplayStatus.returned => 'Dikembalikan',
  };

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (Color bg, Color fg) = switch (status) {
      DisplayStatus.available => (scheme.primaryContainer, scheme.onPrimaryContainer),
      DisplayStatus.borrowed => (scheme.secondaryContainer, scheme.onSecondaryContainer),
      DisplayStatus.overdue => (scheme.tertiaryContainer, scheme.onTertiaryContainer),
      DisplayStatus.missing => (scheme.errorContainer, scheme.onErrorContainer),
      DisplayStatus.returned => (scheme.surfaceContainerHighest, scheme.onSurface),
    };

    return Chip(
      label: Text(_label, style: TextStyle(color: fg)),
      backgroundColor: bg,
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}