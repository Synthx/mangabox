import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'series_state.dart';

class SeriesScreenCubit extends Cubit<SeriesScreenState> {
  final EditionService editionService;

  SeriesScreenCubit({
    required this.editionService,
    required Series series,
  }) : super(SeriesScreenState(
          series: series,
          editions: const LazyState(),
        ));

  Future<void> init() async {
    emit(state.copyWith.editions(loading: true));
    final page = await editionService.findBySeries(
      series: state.series.id,
    );
    emit(state.copyWith.editions(
      loading: false,
      content: page.content,
    ));
  }
}
