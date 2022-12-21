import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'edition_state.dart';

class EditionScreenCubit extends Cubit<EditionScreenState>
    implements UpdatableStore {
  final CollectionStore collectionStore;
  final UpdatableStore? updatableStore;
  final BookService bookService;

  EditionScreenCubit({
    required this.collectionStore,
    required this.bookService,
    required Edition edition,
    this.updatableStore,
  }) : super(EditionScreenState(
          edition: edition,
          books: const LazyState(),
        ));

  Future<void> init() async {
    emit(state.copyWith.books(loading: true));
    final page = await bookService.findByEdition(
      edition: state.edition.id,
      pageable: const Pageable(size: 200),
    );
    emit(state.copyWith.books(
      loading: false,
      content: page.content
          .map((e) => e.copyWith(addedAt: collectionStore.get(e)))
          .toList(growable: false),
      total: page.total,
    ));
  }

  @override
  Future<void> update(List<Book> books) async {
    await updatableStore?.update(books);
    emit(state.copyWith.books(
      content: state.books.content
          .map((e) => books.firstWhere((b) => b.id == e.id, orElse: () => e))
          .toList(growable: false),
    ));
  }
}
