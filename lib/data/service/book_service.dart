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
        .orderBy(pageable.sort.column, descending: pageable.sort.descending);
    if (pageable.lastId != null) {
      final lastDoc =
          await firestore.collection('books').doc(pageable.lastId!).get();
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
        .orderBy(pageable.sort.column);
    if (pageable.lastId != null) {
      final lastDoc =
          await firestore.collection('books').doc(pageable.lastId!).get();
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

  Future<Page<Book>> findSameEdition({
    required String editionId,
    required Pageable pageable,
  }) async {
    var query = firestore
        .collection('books')
        .where('edition.id', isEqualTo: editionId)
        .orderBy(pageable.sort.column, descending: pageable.sort.descending);
    if (pageable.lastId != null) {
      final lastDoc =
          await firestore.collection('books').doc(pageable.lastId!).get();
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
