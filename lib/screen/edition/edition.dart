import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'edition_app_bar.dart';
import 'edition_books.dart';
import 'edition_cubit.dart';
import 'edition_header.dart';
import 'edition_loader.dart';
import 'edition_title.dart';

class EditionScreen<T extends UpdatableStore> extends StatelessWidget {
  final Edition edition;

  const EditionScreen({
    required this.edition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditionScreenCubit(
        updatableStore: context.read<T?>(),
        collectionStore: context.read(),
        bookService: getIt(),
        edition: edition,
      )..init(),
      child: const _EditionScreenWrapper(),
    );
  }
}

class _EditionScreenWrapper extends StatefulWidget {
  const _EditionScreenWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _EditionScreenWrapperState();
}

class _EditionScreenWrapperState extends State<_EditionScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const EditionScreenAppBar(),
      body: CustomScrollView(
        slivers: [
          const EditionScreenHeader(),
          const EditionScreenTitle(),
          const EditionScreenBooks(),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: kSpacer + context.safePaddingBottom,
            ),
            sliver: const EditionScreenLoader(),
          ),
        ],
      ),
    );
  }
}
