import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'author_app_bar.dart';
import 'author_cubit.dart';
import 'author_loader.dart';
import 'author_series.dart';
import 'author_title.dart';

class AuthorScreen extends StatelessWidget {
  final Author author;

  const AuthorScreen({
    required this.author,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorScreenCubit(
        seriesService: getIt(),
        author: author,
      )..init(),
      child: const _AuthorScreenWrapper(),
    );
  }
}

class _AuthorScreenWrapper extends StatefulWidget {
  const _AuthorScreenWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _AuthorScreenWrapperState();
}

class _AuthorScreenWrapperState extends State<_AuthorScreenWrapper> {
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
      // context.read<AuthorScreenCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AuthorScreenAppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const AuthorScreenTitle(),
          const AuthorScreenSeries(),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: kSpacer + context.safePaddingBottom,
            ),
            sliver: const AuthorScreenLoader(),
          ),
        ],
      ),
    );
  }
}
