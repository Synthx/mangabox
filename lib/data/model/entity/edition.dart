import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'edition.freezed.dart';

part 'edition.g.dart';

@freezed
class Edition with _$Edition {
  const factory Edition({
    required String id,
    required String name,
    required EditionStatus status,
    required Series series,
    required Publisher publisher,
    String? picture,
    int? ownedBooks,
  }) = _Edition;

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);
}
