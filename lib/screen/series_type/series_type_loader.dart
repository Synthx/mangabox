import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/widget/widget.dart';

import 'series_type_state.dart';
import 'series_type_store.dart';

class SeriesTypeScreenLoader extends StatelessWidget {
  const SeriesTypeScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesTypeScreenStore, SeriesTypeScreenState, bool>(
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
