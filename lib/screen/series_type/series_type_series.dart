import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'series_type_state.dart';
import 'series_type_store.dart';

class SeriesTypeScreenSeries extends StatelessWidget {
  const SeriesTypeScreenSeries({Key? key}) : super(key: key);

  void _openSeriesScreen({
    required BuildContext context,
    required Series series,
  }) {
    final store = context.read<SeriesTypeScreenStore>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: SeriesScreen<SeriesTypeScreenStore>(series: series),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesTypeScreenStore, SeriesTypeScreenState,
        List<Series>>(
      selector: (state) => state.series.content,
      builder: (context, series) {
        return SliverGrid(
          gridDelegate: kDefaultGridDelegate,
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return SeriesCard(
                series: series[index],
                onTap: () => _openSeriesScreen(
                  context: context,
                  series: series[index],
                ),
              );
            },
            childCount: series.length,
          ),
        );
      },
    );
  }
}
