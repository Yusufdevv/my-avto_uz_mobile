import 'dart:io';
import 'dart:ui';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imageview360/imageview360.dart';

class View360Screen extends StatefulWidget {
  final List<String> images;
  final bool isFromPreview;

  const View360Screen({required this.images, this.isFromPreview = true, Key? key}) : super(key: key);

  @override
  State<View360Screen> createState() => _View360ScreenState();
}

class _View360ScreenState extends State<View360Screen> {
  ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndexNotifier,
                builder: (context, value, child) => CachedNetworkImage(
                  imageUrl: widget.images[value],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: const SizedBox(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageView360(
                  key: UniqueKey(),
                  imageList: List.generate(widget.images.length, (index) {
                    if (widget.images[index].startsWith('http')) {
                      return CachedNetworkImageProvider(widget.images[index]);
                    } else {
                      return FileImage(File(widget.images[index]));
                    }
                  }),
                  rotationCount: 10,
                  rotationDirection: RotationDirection.clockwise,
                  frameChangeDuration: const Duration(milliseconds: 50),
                  swipeSensitivity: 2,
                  allowSwipeToRotate: true,
                  onImageIndexChanged: (currentImageIndex) {
                    currentIndexNotifier.value = currentImageIndex ?? 0;
                  },
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [black, black.withOpacity(0.2)],
                    // stops: const [0.3, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          AppIcons.chevronLeftWhite,
                        ),
                      ),
                    ),
                    Text(
                      LocaleKeys.image_360.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      width: 56,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                alignment: Alignment.center,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [black, black.withOpacity(0.2)],
                    // stops: const [0.3, 0.9],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 4,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: white.withOpacity(0.17)),
                    ),
                    ValueListenableBuilder<int>(
                      valueListenable: currentIndexNotifier,
                      builder: (context, value, child) => Positioned(
                        left: getLeftPosition(widget.images.length, value),
                        child: child ?? const SizedBox.shrink(),
                      ),
                      child: Container(
                        height: 8,
                        width: 200 / widget.images.length,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  double getLeftPosition(int imageListLength, int currentIndex) {
    final leftPosition = currentIndex * ((200 / imageListLength) + 2);
    return leftPosition;
  }
}
