import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangabox/data/data.dart';

class EditionService {
  final firestore = FirebaseFirestore.instance;

  Future<Page<Edition>> findBySeries({
    required String series,
  }) async {
    final snapshot = await firestore
        .collection('editions')
        .where('series.id', isEqualTo: series)
        .get();
    return Page(
      content: snapshot.docs
          .map((e) => Edition.fromJson(e.data()))
          .toList(growable: false),
      total: snapshot.docs.length,
    );
  }
}
