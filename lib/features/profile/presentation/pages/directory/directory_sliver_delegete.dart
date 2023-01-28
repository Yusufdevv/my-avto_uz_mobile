import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/widgets/animated_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DirectorySliverDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final String category;
  final String name;
  final String avatarImage;
  final List<String> gallery;

  DirectorySliverDelegate({
    required this.category,
    required this.minHeight,
    required this.name,
    required this.avatarImage,
    required this.gallery,
  });

  final Duration _duration = const Duration(milliseconds: 200);

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: shrinkOffset >= 20 && shrinkOffset <= 60
                ? 0.8
                : shrinkOffset >= 60 && shrinkOffset <= 80
                    ? 0.6
                    : shrinkOffset >= 80 && shrinkOffset <= 160
                        ? 0.4
                        : shrinkOffset >= 158
                            ? 0.2
                            : 1,
            child: AnimatedImages(
                images: gallery,
                screenWidth: MediaQuery.of(context).size.width),
          ),
          Positioned(
              top: 60,
              left: 0,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:
                        SvgPicture.asset(AppIcons.chevronLeft, color: solitude),
                  ))),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedContainer(
                    decoration: BoxDecoration(
                        borderRadius: shrinkOffset >= 158
                            ? BorderRadius.zero
                            : BorderRadius.circular(12),
                        color: shrinkOffset >= 158
                            ? Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToNero
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteWithOpacity90ToNero,
                        border: shrinkOffset >= 158
                            ? null
                            : Border.all(
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmoke2ToNightRider)),
                    padding: shrinkOffset >= 158
                        ? EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * 0.02,
                            left: 16,
                            bottom: 16,
                          )
                        : const EdgeInsets.all(12),
                    margin: shrinkOffset >= 158
                        ? EdgeInsets.zero
                        : const EdgeInsets.symmetric(horizontal: 20),
                    duration: _duration,
                    child: Row(
                      children: [
                        AnimatedCrossFade(
                          duration: _duration,
                          firstChild: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                          secondChild: const SizedBox(),
                          crossFadeState: shrinkOffset >= 158
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                        ),
                        SizedBox(width: shrinkOffset >= 158 ? 12 : 0),
                        // CircleAvatar(
                        //   radius: shrinkOffset >= 158 ? 32 : 48,
                        //   child: CachedNetworkImage(
                        //     imageUrl: avatarImage,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        AnimatedContainer(
                          height: shrinkOffset >= 158 ? 32 : 48,
                          width: shrinkOffset >= 158 ? 32 : 48,
                          duration: _duration,
                          child: CachedNetworkImage(
                            imageUrl: avatarImage,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Image.asset(
                                AppImages.autoUz,
                                fit: BoxFit.cover),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  border: Border.all(color: dividerColor)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedDefaultTextStyle(
                                  duration: _duration,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize:
                                              shrinkOffset >= 158 ? 14 : 16),
                                  child: Text(name,
                                      overflow: TextOverflow.ellipsis)),
                              AnimatedDefaultTextStyle(
                                  duration: _duration,
                                  style: TextStyle(
                                      fontSize: shrinkOffset >= 158 ? 12 : 14,
                                      fontWeight: FontWeight.w400,
                                      color: purple),
                                  child: Text(category)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: const Divider(height: 1),
                    secondChild: const SizedBox(),
                    crossFadeState: shrinkOffset >= 158
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: _duration,
                  )
                ],
              ),
            ),
          )
        ],
      );

  @override
  double get maxExtent => 260;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
