import 'package:flutter/cupertino.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/dialog/dialog.dart';

class DialogService {
  Future<bool?> askConfirmation({
    required String title,
    required String content,
  }) async {
    final context = navigatorKey.currentContext;
    if (context == null) return null;

    return showCupertinoModalPopup<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => ConfirmationDialog(
        title: title,
        content: content,
      ),
    );
  }
}
