import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'author_state.dart';

class AuthorScreenCubit extends Cubit<AuthorScreenState>
    implements UpdatableStore {
  final UpdatableStore? updatableStore;
  final SeriesService seriesService;

  AuthorScreenCubit({
    required this.seriesService,
    required Author author,
    this.updatableStore,
  }) : super(AuthorScreenState(
          author: author,
          series: const LazyState(),
        ));

  Future<void> init() async {
    emit(state.copyWith.series(loading: true));

    final page = await seriesService.findByAuthor(
      author: state.author.id,
    );
    emit(state.copyWith.series(
      loading: false,
      content: page.content,
      total: page.total,
    ));
  }

  Future<void> loadMore() async {
    if (!state.series.canLoadMore) return;

    emit(state.copyWith.series(loading: true));
    final page = await seriesService.findByAuthor(
      author: state.author.id,
      pageable: Pageable(
        startAfter: state.series.content.last.id,
      ),
    );
    emit(state.copyWith.series(
      loading: false,
      content: [...state.series.content, ...page.content],
    ));
  }

  @override
  Future<void> update(List<Book> books) async {
    await updatableStore?.update(books);
  }
}
