import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';

class Picture extends StatelessWidget {
  final String? picture;
  final double radius;

  const Picture({
    required this.picture,
    this.radius = kRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (picture == null) {
      return _PictureCard(
        radius: radius,
        child: const Icon(Icons.image_outlined),
      );
    }

    return CachedNetworkImage(
      imageUrl:
          'https://storage.googleapis.com/manga-box-a06e0.appspot.com/$picture',
      placeholder: (context, url) => _PictureCard(
        radius: radius,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) {
        log.severe('Failed to load picture: $picture', error);
        return _PictureCard(
          radius: radius,
          child: Icon(
            Icons.error_outline,
            color: Theme.of(context).errorColor,
          ),
        );
      },
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _PictureCard extends StatelessWidget {
  final Widget child;
  final double radius;

  const _PictureCard({
    required this.child,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
