import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class CollectionService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> add({
    required Map<String, DateTime> books,
    required Book book,
    required String user,
  }) async {
    final reference = _firestore.collection('users').doc(user);
    await Future.wait([
      reference.update({'books': books}),
      reference.collection('books').doc(book.id).set(book.toJson()),
    ]);
  }

  Future<void> remove({
    required Map<String, DateTime> books,
    required Book book,
    required String user,
  }) async {
    final reference = _firestore.collection('users').doc(user);

    await Future.wait([
      reference.update({'books': books}),
      reference.collection('books').doc(book.id).delete(),
    ]);
  }

  Future<Map<String, DateTime>> get({
    required String user,
  }) async {
    final reference = _firestore.collection('users').doc(user);
    final snapshot = await reference.get();
    if (!snapshot.exists) {
      return reference.set({'books': {}}).then((_) => {});
    }

    final books = snapshot.data()!['books'] as Map<String, dynamic>;
    return books.map((key, value) => MapEntry(
          key,
          (value as Timestamp).toDate(),
        ));
  }
}
