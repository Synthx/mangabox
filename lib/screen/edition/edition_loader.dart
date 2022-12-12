import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/screen/edition/edition_cubit.dart';
import 'package:mangabox/screen/edition/edition_state.dart';
import 'package:mangabox/widget/widget.dart';

class EditionScreenLoader extends StatelessWidget {
  const EditionScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionScreenCubit, EditionScreenState, bool>(
      selector: (state) => state.books.loading,
      builder: (context, loading) {
        if (loading) {
          return const SliverMbxLoader();
        }

        return const SliverToBoxAdapter();
      },
    );
  }
}
