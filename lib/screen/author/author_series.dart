import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'author_cubit.dart';
import 'author_state.dart';

class AuthorScreenSeries extends StatelessWidget {
  const AuthorScreenSeries({Key? key}) : super(key: key);

  void _openSeriesScreen({
    required BuildContext context,
    required Series series,
  }) {
    final store = context.read<AuthorScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: SeriesScreen(series: series),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthorScreenCubit, AuthorScreenState, List<Series>>(
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
