import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'series_cubit.dart';
import 'series_state.dart';

class SeriesScreenTitle extends StatelessWidget {
  const SeriesScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesScreenCubit, SeriesScreenState, Series>(
      selector: (state) => state.series,
      builder: (context, series) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                series.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
