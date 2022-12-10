import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort.freezed.dart';

@freezed
class Sort with _$Sort {
  const factory Sort({
    @Default('id') String column,
    @Default(false) bool descending,
  }) = _Sort;
}
