import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'add_book_store.dart';

class EditionAddBookScreenListTile extends StatelessWidget {
  final Book book;

  const EditionAddBookScreenListTile({
    required this.book,
    Key? key,
  }) : super(key: key);

  void _onBookSelected({
    required BuildContext context,
    required Book book,
  }) {
    context.read<EditionAddBookScreenStore>().selectBook(book);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onBookSelected(
        context: context,
        book: book,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Picture(
                    picture: book.picture,
                  ),
                ),
                if (book.addedAt != null)
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadius),
                        border: Border.all(
                          color: context.primaryColor,
                          width: 3,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: context.primaryColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(10),
          Text(
            'Volume ${book.volume}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.primaryTextColor,
                ),
          ),
          Text(book.localePublicationDate()),
        ],
      ),
    );
  }
}
