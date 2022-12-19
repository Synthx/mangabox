import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'recent_state.dart';

class RecentBookScreenCubit extends Cubit<RecentBookScreenState> {
  final BookService bookService;

  RecentBookScreenCubit({
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
      content: page.content,
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
      content: [...state.books.content, ...page.content],
    ));
  }
}
