import 'package:auto/features/common/widgets/image_preload_shimmer.dart';
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
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          border: border,
        ),
        child: imageUrl.isEmpty
            ? null
            : ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.circular(0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: width,
                  height: height,
                  color: color,
                  fit: fit,
                  placeholder: (context, url) => ImagePreloadShimmer(
                    height: preloadHeight,
                    width: preloadWidth,
                  ),
                  errorWidget: (context, url, error) => ImagePreloadShimmer(
                    height: preloadHeight,
                    width: preloadWidth,
                  ),
                ),
              ),
      );
}
