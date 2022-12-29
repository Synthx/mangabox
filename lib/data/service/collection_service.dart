import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class CollectionService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> add({
    required Map<String, DateTime> books,
    required Book book,
    required String user,
  }) async {
    final ref = _firestore.collection('users').doc(user);
    final editionRef = ref.collection('editions').doc(book.edition.id);
    final now = DateTime.now();

    await _firestore.runTransaction((transaction) async {
      final editionSnapshot = await transaction.get(editionRef);

      transaction.set(ref.collection('books').doc(book.id), book.toJson());
      transaction.update(ref, {'books': books, 'lastModifiedAt': now});
      if (editionSnapshot.exists) {
        transaction.update(
          editionRef,
          {
            'picture': book.picture,
            'lastAddedAt': now,
            'ownedBooks': FieldValue.increment(1),
          },
        );
      } else {
        transaction.set(
          editionRef,
          {
            ...book.edition.toJson(),
            'picture': book.picture,
            'lastAddedAt': now,
            'ownedBooks': 1,
          },
        );
      }
    });
  }

  Future<void> remove({
    required Map<String, DateTime> books,
    required Book book,
    required String user,
  }) async {
    final ref = _firestore.collection('users').doc(user);
    final editionRef = ref.collection('editions').doc(book.edition.id);
    final now = DateTime.now();

    final lastAddedBookSnapshot = await ref
        .collection('books')
        .where('edition.id', isEqualTo: book.edition.id)
        .orderBy('addedAt', descending: true)
        .limit(2)
        .get();
    final lastAddedBook = lastAddedBookSnapshot.docs
        .map((e) => Book.fromJson(e.data()))
        .firstWhere((e) => e.id != book.id, orElse: () => book);

    await _firestore.runTransaction((transaction) async {
      final editionSnapshot = await transaction.get(editionRef);
      final edition = OwnedEdition.fromJson(editionSnapshot.data()!);

      transaction.delete(ref.collection('books').doc(book.id));
      transaction.update(ref, {'books': books, 'lastModifiedAt': now});
      if (edition.ownedBooks == 1) {
        transaction.delete(editionRef);
      } else {
        transaction.update(
          editionRef,
          {
            'picture': lastAddedBook.picture,
            'lastAddedAt': lastAddedBook.addedAt,
            'ownedBooks': FieldValue.increment(-1),
          },
        );
      }
    });
  }

  Future<Map<String, DateTime>> get({
    required String user,
  }) async {
    final reference = _firestore.collection('users').doc(user);
    final snapshot = await reference.get();
    if (!snapshot.exists) {
      return reference.set({'books': {}}).then((_) => {});
    }

    final books = snapshot.data()?['books'] as Map<String, dynamic>?;
    if (books == null) {
      return reference.update({'books': {}}).then((_) => {});
    }

    return books.map((key, value) => MapEntry(
          key,
          (value as Timestamp).toDate(),
        ));
  }

  Future<Page<Edition>> getEditions({
    required String user,
    Pageable? pageable,
  }) async {
    final query = _firestore
        .collection('users')
        .doc(user)
        .collection('editions')
        .orderBy('lastAddedAt', descending: true);

    final snapshot = await query.limit(pageable?.size ?? 20).get();
    final aggSnapshot = await query.count().get();

    return Page(
      content: snapshot.docs
          .map((e) => Edition.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }
}
