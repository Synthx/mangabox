import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'publisher_state.freezed.dart';

@freezed
class PublisherScreenState with _$PublisherScreenState {
  const factory PublisherScreenState({
    required Publisher publisher,
    required LazyState<Edition> editions,
  }) = _PublisherScreenState;
}
