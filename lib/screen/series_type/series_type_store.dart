import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'series_type_state.dart';

class SeriesTypeScreenStore extends Cubit<SeriesTypeScreenState>
    implements UpdatableStore {
  final UpdatableStore? updatableStore;
  final SeriesService seriesService;

  SeriesTypeScreenStore({
    required this.seriesService,
    required SeriesType seriesType,
    this.updatableStore,
  }) : super(SeriesTypeScreenState(
          seriesType: seriesType,
          series: const LazyState(),
        ));

  Future<void> init() async {
    emit(state.copyWith.series(loading: true));
    final page = await seriesService.findByType(
      type: state.seriesType.id,
    );
    emit(state.copyWith.series(
      content: page.content,
      total: page.total,
      loading: false,
    ));
  }

  @override
  Future<void> update(List<Book> books) async {
    await updatableStore?.update(books);
  }
}
