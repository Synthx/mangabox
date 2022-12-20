import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'book_state.dart';
import 'book_cubit.dart';

class BookScreenTitle extends StatelessWidget {
  const BookScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookScreenCubit, BookScreenState, Book>(
      selector: (state) => state.book,
      builder: (context, book) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
