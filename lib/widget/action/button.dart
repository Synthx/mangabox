import 'package:flutter/material.dart';
import 'package:mangabox/theme/theme.dart';

class MbxButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const MbxButton(
    this.text, {
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusFull),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
