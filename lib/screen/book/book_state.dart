import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'book_state.freezed.dart';

@freezed
class BookScreenState with _$BookScreenState {
  const factory BookScreenState({
    required AddableState<Book> book,
    required LazyState<Book> sameEdition,
  }) = _BookScreenState;
}
