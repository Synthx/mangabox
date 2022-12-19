import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class BookService {
  final firestore = FirebaseFirestore.instance;

  Future<Page<Book>> findRecent({
    required Pageable pageable,
  }) async {
    var query = firestore
        .collection('books')
        .where('publicationDate', isLessThanOrEqualTo: Timestamp.now())
        .orderBy('publicationDate', descending: true);
    if (pageable.startAfter != null) {
      final lastDoc =
          await firestore.collection('books').doc(pageable.startAfter!).get();
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.limit(pageable.size).get();
    final aggSnapshot = await query.count().get();
    return Page(
      content: snapshot.docs
          .map((e) => Book.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }

  Future<Page<Book>> findUpcoming({
    required Pageable pageable,
  }) async {
    var query = firestore
        .collection('books')
        .where('publicationDate', isGreaterThan: Timestamp.now())
        .orderBy('publicationDate');
    if (pageable.startAfter != null) {
      final lastDoc =
          await firestore.collection('books').doc(pageable.startAfter!).get();
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.limit(pageable.size).get();
    final aggSnapshot = await query.count().get();
    return Page(
      content: snapshot.docs
          .map((e) => Book.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }

  Future<Page<Book>> findByEdition({
    required String edition,
    required Pageable pageable,
  }) async {
    var query = firestore
        .collection('books')
        .where('edition.id', isEqualTo: edition)
        .orderBy('volume', descending: true);
    if (pageable.startAfter != null) {
      final lastDoc =
          await firestore.collection('books').doc(pageable.startAfter!).get();
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.limit(pageable.size).get();
    final aggSnapshot = await query.count().get();
    return Page(
      content: snapshot.docs
          .map((e) => Book.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }
}
