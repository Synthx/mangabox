import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class EditionService {
  final firestore = FirebaseFirestore.instance;
  final _collection = 'editions';

  Future<Page<Edition>> findBySeries({
    required String series,
  }) async {
    final snapshot = await firestore
        .collection(_collection)
        .where('series.id', isEqualTo: series)
        .get();
    return Page(
      content: snapshot.docs
          .map((e) => Edition.fromJson(e.data()))
          .toList(growable: false),
      total: snapshot.docs.length,
    );
  }

  Future<Page<Edition>> findByPublisher({
    required String publisher,
    required Pageable pageable,
  }) async {
    var query = firestore
        .collection(_collection)
        .where('publisher.id', isEqualTo: publisher);
    if (pageable.startAfter != null) {
      final lastDoc =
          await firestore.collection(_collection).doc(pageable.startAfter!).get();
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.limit(pageable.size).get();
    final aggSnapshot = await query.count().get();
    return Page(
      content: snapshot.docs
          .map((e) => Edition.fromJson(e.data()))
          .toList(growable: false),
      total: aggSnapshot.count,
    );
  }
}
