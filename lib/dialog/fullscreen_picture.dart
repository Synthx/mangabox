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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black.withOpacity(0.65),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MbxIconButton(
          icon: Icons.close,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Center(
              child: SizedBox(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
