import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'owned_edition.freezed.dart';
part 'owned_edition.g.dart';

@freezed
class OwnedEdition with _$OwnedEdition {
  const factory OwnedEdition({
    required String id,
    required String name,
    required EditionStatus status,
    required int ownedBooks,
    @TimestampToDateTimeConverter() required DateTime lastAddedAt,
    required Series series,
    required Publisher publisher,
    String? picture,
  }) = _OwnedEdition;

  factory OwnedEdition.fromJson(Map<String, dynamic> json) =>
      _$OwnedEditionFromJson(json);
}
