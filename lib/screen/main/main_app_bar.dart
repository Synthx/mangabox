import 'package:flutter/material.dart';
import 'package:mangabox/dialog/dialog.dart';
import 'package:mangabox/widget/widget.dart';

class MainScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainScreenAppBar({Key? key}) : super(key: key);

  Future<void> _openAboutBottomSheet({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AboutBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerRight,
        child: MbxIconButton(
          icon: Icons.question_mark,
          onTap: () => _openAboutBottomSheet(
            context: context,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
