import 'package:flutter/material.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';

class MbxIconListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subtitle;
  final VoidCallback? onTap;

  const MbxIconListTile({
    required this.title,
    required this.icon,
    this.subtitle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(kRadiusSmall),
        ),
        child: Icon(
          icon,
          color:
              onTap != null ? context.primaryColor : context.secondaryTextColor,
        ),
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: onTap != null
          ? const Icon(
              Icons.chevron_right,
              size: 32,
            )
          : null,
      onTap: () => onTap?.call(),
    );
  }
}
