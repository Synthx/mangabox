import 'package:flutter/cupertino.dart';

enum EditionAddBookAction {
  selectAll,
  unselectAll,
}

class EditionAddBookActionPopup extends StatelessWidget {
  const EditionAddBookActionPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Annuler'),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(
            context,
            EditionAddBookAction.selectAll,
          ),
          isDefaultAction: true,
          child: const Text('Tout sélectionner'),
        ),
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(
            context,
            EditionAddBookAction.unselectAll,
          ),
          isDestructiveAction: true,
          child: const Text('Tout désélectionner'),
        ),
      ],
    );
  }
}
