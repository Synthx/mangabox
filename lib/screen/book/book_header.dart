import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenHeader extends StatelessWidget {
  const BookScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookScreenCubit, BookScreenState, Book>(
      selector: (state) => state.book,
      builder: (context, book) {
        return PictureHeader(
          picture: book.picture,
          child: MbxBadges(
            badges: [
              book.localePublicationDate(),
              book.edition.status.locale(),
              book.edition.publisher.name,
              book.edition.series.type.name,
            ],
          ),
        );
      },
    );
  }
}
