import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'add_book_state.freezed.dart';

@freezed
class EditionAddBookScreenState with _$EditionAddBookScreenState {
  const factory EditionAddBookScreenState({
    required Edition edition,
    required List<Book> books,
    required bool loading,
  }) = _EditionAddBookScreenState;
}
