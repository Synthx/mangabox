import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/widget/widget.dart';

import 'author_cubit.dart';
import 'author_state.dart';

class AuthorScreenLoader extends StatelessWidget {
  const AuthorScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthorScreenCubit, AuthorScreenState, bool>(
      selector: (state) => state.series.loading,
      builder: (context, loading) {
        if (!loading) {
          return const SliverToBoxAdapter();
        }

        return const SliverMbxLoader();
      },
    );
  }
}
