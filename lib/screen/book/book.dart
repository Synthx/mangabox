import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'book_app_bar.dart';
import 'book_cubit.dart';
import 'book_details.dart';
import 'book_header.dart';
import 'book_links.dart';
import 'book_same_edition.dart';
import 'book_summary.dart';
import 'book_title.dart';

class BookScreen extends StatelessWidget {
  final Book book;

  const BookScreen({
    required this.book,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookScreenCubit(
        bookService: getIt(),
        collectionStore: context.read(),
        book: book,
      )..init(),
      child: const _BookScreenWrapper(),
    );
  }
}

class _BookScreenWrapper extends StatefulWidget {
  const _BookScreenWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _BookScreenWrapperState();
}

class _BookScreenWrapperState extends State<_BookScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BookScreenAppBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: kSpacer + context.safePaddingBottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BookScreenHeader(),
            Gap(kSpacer),
            BookScreenTitle(),
            Gap(kSpacer),
            BookScreenSummary(),
            Gap(kSpacer),
            BookScreenLinks(),
            Gap(kSpacer),
            BookScreenDetails(),
            Gap(kSpacer),
            BookScreenSameEdition(),
          ],
        ),
      ),
    );
  }
}
