import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenLinks extends StatelessWidget {
  const BookScreenLinks({Key? key}) : super(key: key);

  void _openEditionScreen({
    required BuildContext context,
    required Edition edition,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditionScreen(edition: edition),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookScreenCubit, BookScreenState, Edition>(
      selector: (state) => state.book.edition,
      builder: (context, edition) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MbxIconListTile(
                title: edition.name,
                subtitle: 'Edition',
                icon: Icons.draw_outlined,
                onTap: () => _openEditionScreen(
                  context: context,
                  edition: edition,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
