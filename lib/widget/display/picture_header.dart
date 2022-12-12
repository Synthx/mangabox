import 'dart:ui' hide Picture;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

class PictureHeader extends StatelessWidget {
  final String? picture;
  final Widget child;

  const PictureHeader({
    required this.picture,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double blur = 5;
    const pictureWidth = 160.0;

    return SizedBox(
      height: 400 + context.safePaddingTop,
      child: Stack(
        children: [
          SizedBox(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
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
            bottom: 0,
            left: kSafeArea,
            right: kSafeArea,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: child,
                ),
                const Gap(kSpacer),
                SizedBox(
                  height: pictureWidth / kPictureRatio,
                  width: pictureWidth,
                  child: Picture(
                    picture: picture,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
