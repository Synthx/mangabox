import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

import 'series_type_app_bar.dart';
import 'series_type_loader.dart';
import 'series_type_series.dart';
import 'series_type_store.dart';
import 'series_type_title.dart';

class SeriesTypeScreen<T extends UpdatableStore> extends StatelessWidget {
  final SeriesType seriesType;

  const SeriesTypeScreen({
    required this.seriesType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesTypeScreenStore(
        updatableStore: context.read<T?>(),
        seriesService: getIt(),
        seriesType: seriesType,
      )..init(),
      child: const _SeriesTypeScreenWrapper(),
    );
  }
}

class _SeriesTypeScreenWrapper extends StatefulWidget {
  const _SeriesTypeScreenWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _SeriesTypeScreenWrapperState();
}

class _SeriesTypeScreenWrapperState extends State<_SeriesTypeScreenWrapper> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SeriesTypeScreenAppBar(),
      body: CustomScrollView(
        slivers: [
          const SeriesTypeScreenTitle(),
          const SeriesTypeScreenSeries(),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: kSpacer + context.safePaddingBottom,
            ),
            sliver: const SeriesTypeScreenLoader(),
          ),
        ],
      ),
    );
  }
}
