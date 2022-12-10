import 'package:flutter/material.dart';

class MbxIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const MbxIconButton({
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          shape: const CircleBorder(),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).textTheme.displayLarge?.color,
          size: 24,
        ),
      ),
    );
  }
}
