import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:auto/features/comparison/presentation/widgets/list_of_added_cars.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_sticky.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverWidget extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;
  final int numberOfAddedCars;
  final bool boolean;
  final ValueChanged<bool> onChanged;
  final VoidCallback onAddCar;
  final ValueChanged<bool> setSticky;

  SliverWidget({
    required this.onAddCar,
    required this.numberOfAddedCars,
    required this.boolean,
    required this.onChanged,
    required this.scrollController,
    required this.setSticky,
  });

  List<AddedCar> items(BuildContext context) {
    var itemsss = <AddedCar>[];
    for (var i = 0; i < numberOfAddedCars; i++) {
      itemsss.add(
        AddedCar(
          key: Key('$i'),
        ),
      );
    }
    return itemsss;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset >= 246) {
      setSticky(true);
    } else {
      setSticky(false);
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 80),
      child: shrinkOffset >= 246
          ? Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              child: ListView(
                shrinkWrap: true,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    numberOfAddedCars,
                    (index) => const StickyAdderCar(),
                  )
                ],
              ),
            )
          : Container(
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeContainerToBlack,
              padding: const EdgeInsets.only(top: 16),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 234,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 16),
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ListOfAddedCars(
                              list: items(context),
                            ),
                            AddNewCar(
                              onTap: onAddCar,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.show_only_difference.tr(),
                              style: const TextStyle(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  double get maxExtent => 310;

  @override
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
