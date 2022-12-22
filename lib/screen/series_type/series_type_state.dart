import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mangabox/data/data.dart';

part 'series_type_state.freezed.dart';

@freezed
class SeriesTypeScreenState with _$SeriesTypeScreenState {
  const factory SeriesTypeScreenState({
    required SeriesType seriesType,
    required LazyState<Series> series,
  }) = _SeriesTypeScreenState;
}
