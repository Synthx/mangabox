import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/widget/widget.dart';

import 'publisher_cubit.dart';
import 'publisher_state.dart';

class PublisherLoader extends StatelessWidget {
  const PublisherLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PublisherScreenCubit, PublisherScreenState, bool>(
      selector: (state) => state.editions.loading,
      builder: (context, loading) {
        if (!loading) {
          return const SliverToBoxAdapter();
        }

        return const SliverMbxLoader();
      },
    );
  }
}
