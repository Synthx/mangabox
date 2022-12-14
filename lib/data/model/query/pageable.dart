import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable.freezed.dart';

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    @Default(20) int size,
    String? startAfter,
  }) = _Pageable;
}
