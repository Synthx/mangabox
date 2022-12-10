import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenEdition extends StatelessWidget {
  const BookScreenEdition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookScreenCubit, BookScreenState, Edition>(
      selector: (state) => state.book.edition,
      builder: (context, edition) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSpacer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edition',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Gap(kSpacer),
              EditionTile(
                edition: edition,
              ),
            ],
          ),
        );
      },
    );
  }
}
