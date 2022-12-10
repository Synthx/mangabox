import 'package:flutter/material.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class EditionTile extends StatelessWidget {
  final Edition edition;

  const EditionTile({
    required this.edition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSpacer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    edition.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              Theme.of(context).textTheme.displaySmall?.color,
                        ),
                  ),
                  Text(
                    edition.status.locale(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    edition.publisher.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
