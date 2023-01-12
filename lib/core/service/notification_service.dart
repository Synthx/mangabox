import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';

class NotificationService {
  void showSuccess({
    required String message,
    String? action,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final snackBar = SnackBar(
      padding: const EdgeInsets.symmetric(
        horizontal: kSpacer,
        vertical: 10,
      ),
      content: Row(
        children: [
          Icon(
            Icons.check_circle_outline_outlined,
            color: context.primaryColor,
          ),
          const Gap(kSpacer),
          Text(message),
        ],
      ),
      action: action != null
          ? SnackBarAction(
              label: action,
              onPressed: () {},
            )
          : null,
    );
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
  }
}
