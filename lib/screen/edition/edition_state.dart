import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'edition_state.freezed.dart';

@freezed
class EditionScreenState with _$EditionScreenState {
  const factory EditionScreenState({
    required Edition edition,
    required List<Book> books,
    required bool loading,
  }) = _EditionScreenState;
}
