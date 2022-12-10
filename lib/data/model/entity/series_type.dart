import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_type.freezed.dart';

part 'series_type.g.dart';

@freezed
class SeriesType with _$SeriesType {
  const factory SeriesType({
    required String id,
    required String name,
    String? description,
  }) = _SeriesType;

  factory SeriesType.fromJson(Map<String, dynamic> json) =>
      _$SeriesTypeFromJson(json);
}
