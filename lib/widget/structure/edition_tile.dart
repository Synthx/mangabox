import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class EditionTile extends StatelessWidget {
  final Edition edition;
  final VoidCallback? onTap;

  const EditionTile({
    required this.edition,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 100 / kPictureRatio,
            width: 100,
            child: Picture(
              picture: edition.picture,
            ),
          ),
          const Gap(kSpacer),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  edition.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: context.primaryTextColor,
                      ),
                ),
                if (edition.ownedBooks != null)
                  Text(
                    edition.ownedBooks! > 1
                        ? '${edition.ownedBooks} Volumes'
                        : '${edition.ownedBooks} Volume',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                const Gap(10),
                Text(
                  '${edition.status.locale()}\n${edition.publisher.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Gap(kSpacer),
          const Icon(
            Icons.chevron_right,
            size: 32,
          ),
        ],
      ),
    );
  }
}
