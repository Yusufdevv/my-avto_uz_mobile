import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_characteristic.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_soon_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DescriptionTabs extends StatefulWidget {
  final String comment;
  final String complectation;
  final String complectationItem;
  final String bodyType;
  final String milleage;
  final String driveType;
  final String engineType;
  final String gearboxType;
  final String enginePower;
  final String engineVolume;

  const DescriptionTabs(
      {Key? key,
      required this.changeIndex,
      required this.comment,
      required this.complectation,
      required this.complectationItem,
      required this.bodyType,
      required this.milleage,
      required this.driveType,
      required this.engineType,
      required this.gearboxType,
      required this.enginePower,
      required this.engineVolume})
      : super(key: key);
  final Function changeIndex;

  @override
  State<DescriptionTabs> createState() => _DescriptionTabsState();
}

class _DescriptionTabsState extends State<DescriptionTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(bottom: 16, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .stormGrey12ToStormGrey24,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: _tabController,
                onTap: (integer) {
                  widget.changeIndex(integer);
                  setState(
                    () {
                      currentIndex = integer;
                    },
                  );
                },
                padding: const EdgeInsets.all(2),
                indicator: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                      color: black.withOpacity(0.12),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToSmoky,
                ),
                labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                labelColor:
                    Theme.of(context).extension<ThemedColors>()!.darkToWhite,
                tabs: [
                  Tab(
                    text: LocaleKeys.description.tr(),
                  ),
                  Tab(
                    text: LocaleKeys.characteristic.tr(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            if (currentIndex == 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SellerComment(
                    comment: widget.comment,
                  ),
                  // EquipmentCard(
                  //   complectation: widget.complectation,
                  //   complectationItem: widget.complectationItem,
                  // ),
                  // VinInfoList(),
                  const VinSoonItem(),
                ],
              )
            else
              CarCharacteristicItem(
                bodyType: widget.bodyType,
                milleage: widget.milleage,
                driveType: widget.driveType,
                engineType: widget.engineType,
                gearboxType: widget.gearboxType,
                enginePower: widget.enginePower,
                engineVolume: widget.engineVolume,
              ),
          ],
        ),
      );
}
