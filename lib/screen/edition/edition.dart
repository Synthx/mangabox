import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';

import 'edition_app_bar.dart';
import 'edition_books.dart';
import 'edition_cubit.dart';
import 'edition_header.dart';
import 'edition_loader.dart';
import 'edition_title.dart';

class EditionScreen extends StatelessWidget {
  final Edition edition;

  const EditionScreen({
    required this.edition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditionScreenCubit(
        bookService: getIt(),
        edition: edition,
      )..load(),
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
  final _scrollController = ScrollController();
  final _throttle = Throttle(duration: const Duration(milliseconds: 250));

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => _throttle.run(_onScroll));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _throttle.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasReachedBottom) {
      context.read<EditionScreenCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const EditionScreenAppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: const [
          EditionScreenHeader(),
          EditionScreenTitle(),
          EditionScreenBooks(),
          EditionScreenLoader(),
        ],
      ),
    );
  }
}
