import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class SeriesService {
  final _firestore = FirebaseFirestore.instance;
  final _collection = 'series';

  Future<Page<Series>> findByAuthor({
    required String author,
    Pageable? pageable,
  }) async {
    var query = _firestore
        .collection(_collection)
        .where('authors.id', isEqualTo: author)
        .orderBy('year', descending: true);
    if (pageable?.startAfter != null) {
      final lastDoc = await _firestore
          .collection(_collection)
          .doc(pageable!.startAfter!)
          .get();
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.limit(pageable?.size ?? 20).get();
    final aggSnapshot = await query.count().get();
    return Page(
      content: snapshot.docs
          .map((e) => Series.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }

  Future<Page<Series>> findByType({
    required String type,
    Pageable? pageable,
  }) async {
    var query = _firestore
        .collection(_collection)
        .where('type.id', isEqualTo: type)
        .orderBy('year', descending: true);
    if (pageable?.startAfter != null) {
      final lastDoc = await _firestore
          .collection(_collection)
          .doc(pageable!.startAfter!)
          .get();
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.limit(pageable?.size ?? 20).get();
    final aggSnapshot = await query.count().get();
    return Page(
      content: snapshot.docs
          .map((e) => Series.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }
}
