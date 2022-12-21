import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'recent_cubit.dart';
import 'recent_state.dart';

class RecentBookScreenGrid extends StatelessWidget {
  const RecentBookScreenGrid({Key? key}) : super(key: key);

  void _openBookScreen({
    required BuildContext context,
    required Book book,
  }) {
    final store = context.read<RecentBookScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: BookScreen<RecentBookScreenCubit>(book: book),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecentBookScreenCubit, RecentBookScreenState,
        List<Book>>(
      selector: (state) => state.books.content,
      builder: (context, books) {
        return SliverGrid(
          gridDelegate: kDefaultGridDelegate,
          delegate: SliverChildBuilderDelegate(
            (context, index) => BookCard(
              book: books[index],
              onTap: () => _openBookScreen(
                context: context,
                book: books[index],
              ),
            ),
            childCount: books.length,
          ),
        );
      },
    );
  }
}
