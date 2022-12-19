import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'publisher_state.dart';

class PublisherScreenCubit extends Cubit<PublisherScreenState> {
  final EditionService editionService;

  PublisherScreenCubit({
    required this.editionService,
    required Publisher publisher,
  }) : super(PublisherScreenState(
          publisher: publisher,
          editions: const LazyState(),
        ));

  Future<void> init() async {
    emit(state.copyWith.editions(loading: true));
    final page = await editionService.findByPublisher(
      publisher: state.publisher.id,
      pageable: const Pageable(),
    );
    emit(state.copyWith.editions(
      loading: false,
      content: page.content,
      total: page.total,
    ));
  }

  Future<void> loadMore() async {
    if (!state.editions.canLoadMore) return;

    emit(state.copyWith.editions(loading: true));
    final page = await editionService.findByPublisher(
      publisher: state.publisher.id,
      pageable: Pageable(
        startAfter: state.editions.content.last.id,
      ),
    );
    emit(state.copyWith.editions(
      loading: false,
      content: [...state.editions.content, ...page.content],
    ));
  }
}
