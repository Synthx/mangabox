import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'series_type_state.dart';
import 'series_type_store.dart';

class SeriesTypeScreenTitle extends StatelessWidget {
  const SeriesTypeScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          top: kTitleSpacer + context.safePaddingTop + kToolbarHeight,
          bottom: kTitleSpacer,
        ),
        child: BlocSelector<SeriesTypeScreenStore, SeriesTypeScreenState,
            SeriesType>(
          selector: (state) => state.seriesType,
          builder: (context, seriesType) {
            return Text(
              seriesType.name,
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
    );
  }
}
