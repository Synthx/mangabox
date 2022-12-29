import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'collection_state.freezed.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState({
    required Map<String, DateTime> books,
    required LazyState<Edition> editions,
  }) = _CollectionState;
}
