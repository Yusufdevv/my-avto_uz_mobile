import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/widgets/animated_images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellerSliverDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final String showroomOrPerson;

  SellerSliverDelegate(
      {required this.showroomOrPerson, required this.minHeight});

  final Duration _duration = const Duration(milliseconds: 80);

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Stack(
        children: [
          if (showroomOrPerson == 'showroom')
            AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: shrinkOffset >= 20 && shrinkOffset <= 60
                  ? 0.8
                  : shrinkOffset >= 60 && shrinkOffset <= 80
                      ? 0.6
                      : shrinkOffset >= 80 && shrinkOffset <= 160
                          ? 0.4
                          : shrinkOffset >= 150
                              ? 0.2
                              : 1,
              child: AnimatedImages(
                screenWidth: MediaQuery.of(context).size.width,
              ),
            )
          else
            Stack(
              children: [
                Container(
                  height: 260,
                  color: green,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 36,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeTo1Black,
                  ),
                ),
              ],
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedContainer(
                    decoration: BoxDecoration(
                        borderRadius: shrinkOffset >= 180
                            ? BorderRadius.zero
                            : BorderRadius.circular(12),
                        color: shrinkOffset >= 180
                            ? Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToNero
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteWithOpacity90ToNero,
                        border: shrinkOffset >= 180
                            ? null
                            : Border.all(
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmoke2ToNightRider)),
                    padding: shrinkOffset >= 180
                        ? EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * 0.02,
                            left: 16,
                            bottom: 16,
                          )
                        : const EdgeInsets.all(12),
                    margin: shrinkOffset >= 180
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
                          crossFadeState: shrinkOffset >= 180
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                        ),
                        SizedBox(width: shrinkOffset >= 180 ? 12 : 0),
                        AnimatedContainer(
                          height: shrinkOffset >= 180 ? 32 : 48,
                          width: shrinkOffset >= 180 ? 32 : 48,
                          duration: _duration,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: dividerColor),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                                duration: _duration,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize:
                                            shrinkOffset >= 180 ? 14 : 16),
                                child: const Text('ORIENT MOTORS')),
                            AnimatedDefaultTextStyle(
                              duration: _duration,
                              style: TextStyle(
                                  fontSize: shrinkOffset >= 180 ? 12 : 14,
                                  fontWeight: FontWeight.w400,
                                  color: purple),
                              child: showroomOrPerson == 'person'
                                  ? Text(
                                      LocaleKeys.private_person.tr(),
                                    )
                                  : Text(
                                      LocaleKeys.autosalon.tr(),
                                    ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: const Divider(
                      height: 1,
                    ),
                    secondChild: const SizedBox(),
                    crossFadeState: shrinkOffset >= 180
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
  // TODO: implement maxExtent
  double get maxExtent => 260;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
