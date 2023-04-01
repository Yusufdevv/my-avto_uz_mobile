import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({
    required this.iconPath,
    required this.url,
    Key? key,
  })  : isFromDirectory = iconPath == AppIcons.directoryPoint,
        super(key: key);
  final String url;
  final String iconPath;
  final bool isFromDirectory;

  @override
  Widget build(BuildContext context) {
    if (isFromDirectory || iconPath == AppIcons.currentLoc) {
      return SizedBox(
        width: 44,
        height: 64,
        child: Image.asset(
          iconPath,
          width: 44,
          height: 64,
        ),
      );
    }
    return SizedBox(
      width: 44,
      height: 64,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              iconPath,
              width: 44,
              height: 64,
              color: Colors.red,
            ),
            Positioned(
              top: 7,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: dividerColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    width: 30,
                    height: 30,
                    imageUrl: url,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.defaultPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
