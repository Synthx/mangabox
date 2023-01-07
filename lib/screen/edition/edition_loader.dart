import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/widget/widget.dart';

import 'edition_cubit.dart';
import 'edition_state.dart';

class EditionScreenLoader extends StatelessWidget {
  const EditionScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionScreenCubit, EditionScreenState, bool>(
      selector: (state) => state.loading,
      builder: (context, loading) {
        if (loading) {
          return const SliverMbxLoader();
        }

        return const SliverToBoxAdapter();
      },
    );
  }
}
