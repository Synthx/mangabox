import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/widget/widget.dart';

import 'series_cubit.dart';
import 'series_state.dart';

class SeriesScreenHeader extends StatelessWidget {
  const SeriesScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesScreenCubit, SeriesScreenState, Series>(
      selector: (state) => state.series,
      builder: (context, series) {
        return SliverPictureHeader(
          picture: series.picture,
          child: MbxBadges(
            badges: [
              series.year,
              series.type.name,
            ],
          ),
        );
      },
    );
  }
}
