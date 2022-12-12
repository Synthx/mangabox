import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class EditionTile extends StatelessWidget {
  final Edition edition;

  const EditionTile({
    required this.edition,
    Key? key,
  }) : super(key: key);

  void _openEditionScreen({
    required BuildContext context,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditionScreen(edition: edition),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openEditionScreen(
        context: context,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90 / kPictureRatio,
            width: 90,
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
                const Gap(10),
                Text(
                  '${edition.status.locale()}\n${edition.publisher.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Gap(kSpacer),
          const MbxIconButton(
            icon: Icons.chevron_right,
          ),
        ],
      ),
    );
  }
}
