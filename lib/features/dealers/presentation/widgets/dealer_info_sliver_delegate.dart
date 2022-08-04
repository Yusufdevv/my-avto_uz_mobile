import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/widgets/animated_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellerSliverDelegate extends SliverPersistentHeaderDelegate {
  final String showroomOrPerson;
  SellerSliverDelegate({required this.showroomOrPerson});
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Stack(
        children: [
          if (showroomOrPerson == 'showroom')
            AnimatedImages(screenWidth: MediaQuery.of(context).size.width)
          else
            Container(
              height: 260,
              color: green,
              width: MediaQuery.of(context).size.width,
            ),
          Positioned(
              top: 60,
              left: 16,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      SvgPicture.asset(AppIcons.chevronLeft, color: solitude))),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: shrinkOffset >= 230
                      ? BorderRadius.zero
                      : BorderRadius.circular(12),
                  color: shrinkOffset >= 230
                      ? Theme.of(context).extension<ThemedColors>()!.whiteToNero
                      : Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteWithOpacity90ToNero,
                  border: shrinkOffset >= 230
                      ? null
                      : Border.all(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmoke2ToNightRider)),
              padding: shrinkOffset >= 230
                  ? EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: 16,
                      bottom: 16,
                    )
                  : const EdgeInsets.all(12),
              margin: shrinkOffset >= 230
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 20),
              duration: const Duration(milliseconds: 80),
              child: Row(
                children: [
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 80),
                    firstChild: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppIcons.chevronLeft),
                    ),
                    secondChild: const SizedBox(),
                    crossFadeState: shrinkOffset >= 230
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  const SizedBox(
                    width: 68,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 80),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: shrinkOffset >= 230 ? 14 : 16),
                          child: const Text('ORIENT MOTORS')),
                      AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 80),
                          style: TextStyle(
                              fontSize: shrinkOffset >= 230 ? 12 : 14,
                              fontWeight: FontWeight.w400,
                              color: purple),
                          child: showroomOrPerson == 'person'
                              ? const Text('Частное лицо')
                              : const Text('Автосалон')),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => 260;

  @override
  // TODO: implement minExtent
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
