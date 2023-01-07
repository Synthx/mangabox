import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'add_book_app_bar.dart';
import 'add_book_list.dart';
import 'add_book_save_button.dart';
import 'add_book_store.dart';

class EditionAddBookScreen extends StatelessWidget {
  final Edition edition;
  final List<Book> books;

  const EditionAddBookScreen({
    required this.edition,
    required this.books,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditionAddBookScreenStore(
        collectionStore: context.read(),
        edition: edition,
        books: books,
      ),
      child: const _EditionAddBookScreenWrapper(),
    );
  }
}

class _EditionAddBookScreenWrapper extends StatelessWidget {
  const _EditionAddBookScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: EditionAddBookScreenAppBar(),
      floatingActionButton: EditionAddBookSaveButton(),
      body: EditionAddBookScreenList(),
    );
  }
}
