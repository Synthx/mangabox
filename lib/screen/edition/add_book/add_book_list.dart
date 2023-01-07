import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'add_book_list_tile.dart';
import 'add_book_state.dart';
import 'add_book_store.dart';

class EditionAddBookScreenList extends StatelessWidget {
  const EditionAddBookScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionAddBookScreenStore, EditionAddBookScreenState,
        List<Book>>(
      selector: (state) => state.books,
      builder: (context, books) {
        return GridView.builder(
          gridDelegate: kDefaultGridDelegate,
          itemCount: books.length,
          padding: EdgeInsets.only(
            top: context.safePaddingTop + kToolbarHeight,
            bottom: context.safePaddingBottom + kBottomNavigationBarHeight + 60,
          ),
          itemBuilder: (context, index) {
            return EditionAddBookScreenListTile(
              book: books[index],
            );
          },
        );
      },
    );
  }
}
