import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_state.freezed.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState({
    required Map<String, DateTime> books,
  }) = _CollectionState;
}
