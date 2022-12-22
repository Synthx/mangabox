import 'dart:ui' hide Picture;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/dialog/dialog.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class SliverPictureHeader extends StatelessWidget {
  final String? picture;
  final Widget child;

  const SliverPictureHeader({
    required this.picture,
    required this.child,
    Key? key,
  }) : super(key: key);

  void _openFullscreenPicture({
    required BuildContext context,
  }) {
    if (picture == null) return;

    showDialog(
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => FullscreenPictureDialog(
        picture: picture!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      automaticallyImplyLeading: false,
      collapsedHeight: 400 + context.safePaddingTop,
      expandedHeight: 400 + context.safePaddingTop,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.0),
                      ],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Picture(
                    picture: picture,
                  ),
                ),
              ),
            ),
            Positioned(
              left: kSafeArea,
              right: kSafeArea,
              bottom: kSpacer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: child,
                  ),
                  const Gap(kSpacer),
                  SizedBox(
                    height: 160 / kPictureRatio,
                    width: 160,
                    child: GestureDetector(
                      onTap: () => _openFullscreenPicture(
                        context: context,
                      ),
                      child: Picture(
                        picture: picture,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
