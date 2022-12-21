import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'recent_state.dart';

class RecentBookScreenCubit extends Cubit<RecentBookScreenState>
    implements UpdatableStore {
  final CollectionStore collectionStore;
  final BookService bookService;

  RecentBookScreenCubit({
    required this.collectionStore,
    required this.bookService,
  }) : super(const RecentBookScreenState(
          books: LazyState(),
        ));

  Future<void> load() async {
    emit(state.copyWith.books(loading: true, content: [], total: 0));
    final page = await bookService.findRecent(
      pageable: const Pageable(),
    );
    emit(state.copyWith.books(
      loading: false,
      content: page.content
          .map((e) => e.copyWith(addedAt: collectionStore.get(e)))
          .toList(growable: false),
      total: page.total,
    ));
  }

  Future<void> loadMore() async {
    if (!state.books.canLoadMore) {
      return;
    }

    emit(state.copyWith.books(loading: true));
    final page = await bookService.findRecent(
      pageable: Pageable(
        startAfter: state.books.content.last.id,
      ),
    );
    emit(state.copyWith.books(
      loading: false,
      content: [
        ...state.books.content,
        ...page.content.map((e) => e.copyWith(addedAt: collectionStore.get(e))),
      ],
    ));
  }

  @override
  Future<void> update(List<Book> books) async {
    emit(state.copyWith.books(
      content: state.books.content
          .map((e) => books.firstWhere((b) => b.id == e.id, orElse: () => e))
          .toList(growable: false),
    ));
  }
}
