import 'package:auto/assets/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({
    required this.url,
    required this.scale,
    Key? key,
  }) : super(key: key);

  final String url;
  final double scale;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 44 * scale,
        height: 64 * scale,
        child: Stack(
          children: [
            Image.asset(
              AppIcons.dealersLocIcon,
              width: 44 * scale,
              height: 64 * scale,
            ),
            Positioned(
              top: 7 * scale,
              left: 7 * scale,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  width: 30 * scale,
                  height: 30 * scale,
                  imageUrl: url,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
            )
          ],
        ),
      );
}
