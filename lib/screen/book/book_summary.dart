import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenSummary extends StatelessWidget {
  const BookScreenSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSpacer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Résumé',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.primaryTextColor,
                ),
          ),
          const Gap(10),
          BlocSelector<BookScreenCubit, BookScreenState, String?>(
            selector: (state) => state.book.summary,
            builder: (context, summary) {
              return ExpandableText(
                summary ?? 'Aucun résumé disponible',
                maxLines: 9,
              );
            },
          ),
        ],
      ),
    );
  }
}
