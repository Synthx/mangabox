import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'series.freezed.dart';

part 'series.g.dart';

@freezed
class Series with _$Series {
  const factory Series({
    required String id,
    required String name,
    required String year,
    String? summary,
    String? picture,
    required SeriesType type,
    required List<Author> authors,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}
