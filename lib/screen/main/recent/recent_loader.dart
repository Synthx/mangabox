import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/widget/widget.dart';

import 'recent_cubit.dart';
import 'recent_state.dart';

class RecentScreenBookLoader extends StatelessWidget {
  const RecentScreenBookLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecentBookScreenCubit, RecentBookScreenState, bool>(
      selector: (state) => state.books.loading,
      builder: (context, loading) {
        if (loading) {
          return const SliverLoader();
        }

        return const SliverToBoxAdapter();
      },
    );
  }
}
