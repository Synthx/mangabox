import 'package:flutter/material.dart';

class MbxDivider extends StatelessWidget {
  const MbxDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Divider(
        thickness: 4,
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
