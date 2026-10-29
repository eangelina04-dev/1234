import 'package:flutter/material.dart';

import '../models/book.dart';
import '../viewmodels/book_group.dart';
import '../viewmodels/display_status.dart';
import 'book_card.dart';

class BookGroupSection extends StatelessWidget {
  const BookGroupSection({
    super.key,
    required this.group,
    required this.availableCount,
    required this.statusOf,
    required this.onBorrow,
  });

  final BookTitleGroup group;
  final int availableCount;
  final DisplayStatus Function(Book book) statusOf;
  final void Function(Book book) onBorrow;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final soldOut = availableCount == 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(group.title, style: text.titleMedium),
                    Text(group.author, style: text.bodySmall),
                  ],
                ),
              ),
              Text(
                soldOut
                    ? 'Habis dipinjam'
                    : 'Tersedia $availableCount dari ${group.copies.length}',
                style: text.labelLarge?.copyWith(
                  color: soldOut ? scheme.error : scheme.primary,
                ),
              ),
            ],
          ),
        ),
        for (final copy in group.copies)
          BookCard(
            book: copy,
            status: statusOf(copy),
            onBorrow: () => onBorrow(copy),
          ),
      ],
    );
  }
}