import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/widget/widget.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;
  final String? title;

  const BookCard({
    required this.book,
    this.onTap,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Picture(
              picture: book.picture,
            ),
          ),
          const Gap(10),
          Text(
            title ?? book.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.displayLarge?.color,
                ),
          ),
          Text(
            book.localePublicationDate(),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
