import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliverWidget extends SliverPersistentHeaderDelegate {
  final int numberOfAddedCars;
  final bool boolean;
  final ValueChanged<bool> onChanged;
  SliverWidget(
      {required this.numberOfAddedCars,
      required this.boolean,
      required this.onChanged});

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: shrinkOffset >= 246
            ? Container(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: const [
                    StickyAdderCar(),
                    StickyAdderCar(),
                  ],
                ),
              )
            : Container(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeContainerToBlack,
                padding: const EdgeInsets.only(
                    top: 16, bottom: 8, right: 16, left: 16),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AddedCar(),
                          const SizedBox(width: 12),
                          if (numberOfAddedCars == 1)
                            const AddNewCar()
                          else
                            const AddedCar(),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Показать только отличия',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: greyText,
                              ),
                            ),
                          ),
                          CupertinoSwitch(
                            value: boolean,
                            onChanged: onChanged,
                            activeColor: green,
                            thumbColor: white,
                            trackColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteLilacToPayneGrey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => 315;

  @override
  // TODO: implement minExtent
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class StickyAdderCar extends StatelessWidget {
  const StickyAdderCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Flexible(
        child: Row(
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child:
                    SvgPicture.asset(AppImages.placeHolder, fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '227 000 000 UZS',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Flexible(
                    child: Text(
                      'Lexus LX',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

class AddedCar extends StatelessWidget {
  const AddedCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2 - 22,
            padding: const EdgeInsets.only(bottom: 18),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Container(
              height: 216,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitude2ToNightRider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 22,
                    height: 112,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: SvgPicture.asset(AppImages.placeHolder,
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '227 000 000 UZS',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Lexus LX 600 2022',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Stack(
                children: [
                  SvgPicture.asset(AppIcons.roundedClose),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: WScaleAnimation(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.tablerPhone, color: white),
                    const SizedBox(width: 4),
                    const Text(
                      'Позвонить',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
