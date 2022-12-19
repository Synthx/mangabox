import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

const _defaultTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 17,
  fontWeight: FontWeight.w600,
);

class MbxButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const MbxButton({
    required this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  factory MbxButton.loading() {
    return const MbxButton(
      child: SizedBox(
        height: 25,
        width: 25,
        child: MbxLoader(),
      ),
    );
  }

  factory MbxButton.icon(
    String text, {
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return MbxButton(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _defaultTextStyle.color,
          ),
          const Gap(10),
          Text(
            text,
            style: _defaultTextStyle,
          ),
        ],
      ),
    );
  }

  factory MbxButton.text(
    String text, {
    VoidCallback? onTap,
  }) {
    return MbxButton(
      onTap: onTap,
      child: Text(
        text,
        style: _defaultTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusFull),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 25,
          ),
        ),
        child: child,
      ),
    );
  }
}
