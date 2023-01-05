import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? preloadWidth;
  final double? preloadHeight;

  const CachedImage({
    this.imageUrl = '',
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    this.border,
    this.preloadHeight,
    this.preloadWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          border: border,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            color: color,
            fit: fit,
            placeholder: (context, url) => Image.asset(
              AppImages.defaultPhoto,
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => Image.asset(
              AppImages.defaultPhoto,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
