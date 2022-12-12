import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'edition_state.dart';

class EditionScreenCubit extends Cubit<EditionScreenState> {
  final BookService bookService;

  EditionScreenCubit({
    required this.bookService,
    required Edition edition,
  }) : super(EditionScreenState(
          edition: edition,
          books: const LazyState(),
        ));

  Future<void> load() async {
    emit(state.copyWith.books(loading: true));
    final page = await bookService.findSameEdition(
      editionId: state.edition.id,
      pageable: const Pageable(
        sort: Sort(column: 'publicationDate', descending: true),
      ),
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
    final page = await bookService.findSameEdition(
      editionId: state.edition.id,
      pageable: Pageable(
        lastId: state.books.content.last.id,
        sort: const Sort(column: 'publicationDate', descending: true),
      ),
    );
    emit(state.copyWith.books(
      loading: false,
      content: [...state.books.content, ...page.content],
    ));
  }
}
