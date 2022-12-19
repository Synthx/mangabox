import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'author_state.freezed.dart';

@freezed
class AuthorScreenState with _$AuthorScreenState {
  const factory AuthorScreenState({
    required Author author,
    required LazyState<Series> series,
  }) = _AuthorScreenState;
}
