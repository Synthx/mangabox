import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'add_book_action_popup.dart';
import 'add_book_store.dart';

class EditionAddBookScreenAppBar extends StatelessWidget
    with PreferredSizeWidget {
  const EditionAddBookScreenAppBar({Key? key}) : super(key: key);

  void _showMoreActionPopup({
    required BuildContext context,
  }) async {
    final store = context.read<EditionAddBookScreenStore>();
    final result = await showCupertinoModalPopup<EditionAddBookAction>(
      context: context,
      builder: (context) => const EditionAddBookActionPopup(),
    );

    switch (result) {
      case EditionAddBookAction.selectAll:
        store.selectAll();
        break;
      case EditionAddBookAction.unselectAll:
        store.unselectAll();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: MbxIconButton(
        icon: Icons.clear_outlined,
        onTap: () => Navigator.of(context).pop(),
      ),
      actions: [
        MbxIconButton(
          icon: Icons.more_vert_outlined,
          onTap: () => _showMoreActionPopup(context: context),
        ),
        const Gap(kSpacer),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
