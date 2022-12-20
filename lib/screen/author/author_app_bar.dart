import 'package:flutter/material.dart';
import 'package:mangabox/widget/widget.dart';

class AuthorScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const AuthorScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: MbxIconButton(
        icon: Icons.chevron_left_outlined,
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
