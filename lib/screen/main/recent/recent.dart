import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';

import 'recent_cubit.dart';
import 'recent_grid.dart';
import 'recent_header.dart';
import 'recent_loader.dart';

class RecentBookScreen extends StatelessWidget {
  const RecentBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecentBookScreenCubit(
        collectionStore: context.read(),
        bookService: getIt(),
      )..load(),
      child: const _RecentBookScreenWrapper(),
    );
  }
}

class _RecentBookScreenWrapper extends StatefulWidget {
  const _RecentBookScreenWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _RecentBookScreenWrapperState();
}

class _RecentBookScreenWrapperState extends State<_RecentBookScreenWrapper> {
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
      context.read<RecentBookScreenCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          RecentBookScreenHeader(),
          RecentBookScreenGrid(),
          RecentScreenBookLoader(),
        ],
      ),
    );
  }
}
