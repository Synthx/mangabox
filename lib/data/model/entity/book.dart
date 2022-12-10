import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';

part 'book.freezed.dart';

part 'book.g.dart';

@freezed
class Book with _$Book {
  const Book._();

  const factory Book({
    required String id,
    required String name,
    @TimestampToDateTimeConverter() required DateTime publicationDate,
    required String isbn,
    required int volume,
    required Edition edition,
    String? asin,
    int? pagesCount,
    String? picture,
    String? summary,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  String localePublicationDate() {
    return publicationDate.locale(
      format: DateFormat.yMMMMd(),
    );
  }
}
