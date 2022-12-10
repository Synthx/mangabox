import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'recent_state.freezed.dart';

@freezed
class RecentBookScreenState with _$RecentBookScreenState {
  const factory RecentBookScreenState({
    required LazyState<Book> books,
  }) = _RecentBookScreenState;
}
