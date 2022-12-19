import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class CollectionService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> add({
    required Book book,
    required String user,
  }) async {
    final data = book.toJson();
    data['addedDate'] = Timestamp.now();

    await _firestore
        .collection('users')
        .doc(user)
        .collection('books')
        .doc(book.id)
        .set(data);
  }

  Future<void> remove({
    required Book book,
    required String user,
  }) async {
    await _firestore
        .collection('users')
        .doc(user)
        .collection('books')
        .doc(book.id)
        .delete();
  }
}
