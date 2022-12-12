import 'package:flutter/material.dart';
import 'package:mangabox/core/core.dart';

class MbxBadges extends StatelessWidget {
  final List<String> badges;

  const MbxBadges({
    required this.badges,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelMedium;
    final widgets = List.generate(badges.length, (index) {
      final value = badges[index];

      return Text(value, style: style);
    }).intersperse(Text('·', style: style)).toList(growable: false);

    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: widgets,
    );
  }
}
