import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({
    required this.url,
    Key? key,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    log(':::::::::: The Url of dealler image:  $url }  ::::::::::');
    return SizedBox(
      width: 44,
      height: 64,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              AppIcons.dealersLocIcon,
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
            Positioned(
              child: Text(
                url.split('.').last,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
