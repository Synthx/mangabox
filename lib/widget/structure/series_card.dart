import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/widget/widget.dart';

class SeriesCard extends StatelessWidget {
  final Series series;

  const SeriesCard({
    required this.series,
    Key? key,
  }) : super(key: key);

  void _openSeriesScreen({
    required BuildContext context,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SeriesScreen(series: series),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openSeriesScreen(
        context: context,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Picture(
              picture: series.picture,
            ),
          ),
          const Gap(10),
          Text(
            series.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.primaryTextColor,
            ),
          ),
          Text(
            series.year,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
