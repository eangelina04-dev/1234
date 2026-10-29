import 'book.dart';
import 'loan.dart';

class LibraryService {
  static final List<Book> _books = [
    const Book(id: 'B-001-01', title: 'Sang Pemimpi', author: 'Andrea Hirata', replacementPrice: 90000,),
    const Book(id: 'B-002', title: 'Laskar Pelangi', author: 'Andrea Hirata', replacementPrice: 95000),
    const Book(id: 'B-003', title: 'Bumi Manusia', author: 'Pramoedya Ananta Toer', replacementPrice: 120000),
    const Book(id: 'B-004', title: 'Filosofi Teras', author: 'Henry Manampiring', replacementPrice: 98000),
  ];

  static final List<Loan> _loans = [];

  List<Book> readBooks() => List.of(_books);

  void writeBooks(List<Book> books) {
    final copy = List.of(books);
    _books
      ..clear()
      ..addAll(copy);
  }

  List<Loan> readLoans() => List.of(_loans);

  void writeLoans(List<Loan> loans) {
    final copy = List.of(loans);
    _loans
      ..clear()
      ..addAll(copy);
  }
}