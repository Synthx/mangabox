import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'series_app_bar.dart';
import 'series_authors.dart';
import 'series_cubit.dart';
import 'series_editions.dart';
import 'series_header.dart';
import 'series_summary.dart';
import 'series_title.dart';

class SeriesScreen<T extends UpdatableStore> extends StatelessWidget {
  final Series series;

  const SeriesScreen({
    required this.series,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesScreenCubit(
        updatableStore: context.read<T?>(),
        editionService: getIt(),
        series: series,
      )..init(),
      child: const _SeriesScreenWrapper(),
    );
  }
}

class _SeriesScreenWrapper extends StatefulWidget {
  const _SeriesScreenWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _SeriesScreenWrapperState();
}

class _SeriesScreenWrapperState extends State<_SeriesScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SeriesScreenAppBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: kSpacer + context.safePaddingBottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SeriesScreenHeader(),
            Gap(kSpacer),
            SeriesScreenTitle(),
            Gap(kSpacer),
            SeriesScreenSummary(),
            Gap(kSpacer),
            SeriesScreenAuthors(),
            Gap(kSpacer),
            SeriesScreenEditions(),
          ],
        ),
      ),
    );
  }
}
