import 'package:flutter/material.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class FullscreenPictureDialog extends StatelessWidget {
  final String picture;

  const FullscreenPictureDialog({
    required this.picture,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MbxIconButton(
          icon: Icons.close,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              return SizedBox(
                height: width / kPictureRatio,
                width: width,
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 2,
                  child: Picture(
                    radius: kRadiusSmall,
                    picture: picture,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
