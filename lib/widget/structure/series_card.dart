import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/widget/widget.dart';

class SeriesCard extends StatelessWidget {
  final Series series;
  final VoidCallback? onTap;

  const SeriesCard({
    required this.series,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
