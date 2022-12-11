import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/theme/theme.dart';

class MbxIconListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subtitle;

  const MbxIconListTile({
    required this.title,
    required this.icon,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(kRadiusSmall),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        const Gap(kSpacer),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.displayLarge?.color,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
