import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'publisher_app_bar.dart';
import 'publisher_cubit.dart';
import 'publisher_editions.dart';
import 'publisher_loader.dart';
import 'publisher_title.dart';

class PublisherScreen extends StatelessWidget {
  final Publisher publisher;

  const PublisherScreen({
    required this.publisher,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PublisherScreenCubit(
        editionService: getIt(),
        publisher: publisher,
      )..init(),
      child: const _PublisherScreenWrapper(),
    );
  }
}

class _PublisherScreenWrapper extends StatefulWidget {
  const _PublisherScreenWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _PublisherScreenWrapperState();
}

class _PublisherScreenWrapperState extends State<_PublisherScreenWrapper> {
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
      context.read<PublisherScreenCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PublisherScreenAppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const PublisherTitle(),
          const PublisherEditions(),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: kSpacer + context.safePaddingBottom,
            ),
            sliver: const PublisherLoader(),
          ),
        ],
      ),
    );
  }
}
