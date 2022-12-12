import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'series_state.freezed.dart';

@freezed
class SeriesScreenState with _$SeriesScreenState {
  const factory SeriesScreenState({
    required Series series,
    required LazyState<Edition> editions,
  }) = _SeriesScreenState;
}
