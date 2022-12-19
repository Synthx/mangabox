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
    final page = await bookService.findByEdition(
      edition: state.edition.id,
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
    final page = await bookService.findByEdition(
      edition: state.edition.id,
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
