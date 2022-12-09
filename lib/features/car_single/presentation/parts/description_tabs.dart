import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/characteristic_table.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/equipment.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/vin_info_list.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionTabs extends StatefulWidget {
  const DescriptionTabs({Key? key}) : super(key: key);

  @override
  State<DescriptionTabs> createState() => _DescriptionTabsState();
}

class _DescriptionTabsState extends State<DescriptionTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int currentValue = -1;

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
                  setState(() {
                    currentIndex = integer;
                  });
                },
                padding: const EdgeInsets.all(2),
                indicator: BoxDecoration(
                  boxShadow: [
                    // BoxShadow(
                    //   blurRadius: 1,
                    //   offset: const Offset(0, 3),
                    //   color: black.withOpacity(0.4),
                    // ),
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                      color: black.withOpacity(
                        0.12,
                      ),
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
                children: const [
                  SellerComment(),
                  EquipmentCard(),
                  VinInfoList(),
                ],
              )
            else
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                color:
                    Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                child: Column(
                  children: [
                    CharacteristicTable(
                      titleList: [
                        LocaleKeys.gears_number.tr(),
                        LocaleKeys.engine_volume.tr(),
                        LocaleKeys.Min_trunk_volume.tr(),
                        LocaleKeys.Drive_unit.tr(),
                        LocaleKeys.engine_type.tr(),
                        LocaleKeys.Ground_clearance.tr(),
                        LocaleKeys.Acceleration_to_100_kmh.toString(),
                        LocaleKeys.Engine_power.tr(),
                        LocaleKeys.Curb_weight.tr(),
                        LocaleKeys.Fuel_consumption_per_100_km.tr(),
                        LocaleKeys.Transmission.tr(),
                        LocaleKeys.body_type.tr(),
                      ],
                      list: const [
                        '7',
                        '1591 куб.см',
                        '433 л',
                        'Полный',
                        'Бензин',
                        '190 мм',
                        '8.4 с',
                        '177 л.с.',
                        '1425 кг',
                        '7.6 л',
                        'Роботизированная',
                        'Внедорожник 5 дв.',
                      ],
                      title: 'Характеристики автомобиля',
                    ),
                    CharacteristicTable(
                      titleList: [
                        LocaleKeys.gears_number.tr(),
                        LocaleKeys.engine_volume.tr(),
                        LocaleKeys.Min_trunk_volume.tr(),
                        LocaleKeys.Drive_unit.tr(),
                        LocaleKeys.engine_type.tr(),
                        LocaleKeys.Ground_clearance.tr(),
                        LocaleKeys.Acceleration_to_100_kmh.toString(),
                        LocaleKeys.Engine_power.tr(),
                        LocaleKeys.Curb_weight.tr(),
                        LocaleKeys.Fuel_consumption_per_100_km.tr(),
                        LocaleKeys.Transmission.tr(),
                        LocaleKeys.body_type.tr(),
                      ],
                      list: const [
                        '7',
                        '1591 куб.см',
                        '433 л',
                        'Полный',
                        'Бензин',
                        '190 мм',
                        '8.4 с',
                        '177 л.с.',
                        '1425 кг',
                        '7.6 л',
                        'Роботизированная',
                        'Внедорожник 5 дв.',
                      ],
                      title: 'Размеры',
                    ),
                    CharacteristicTable(
                      titleList: [
                        LocaleKeys.gears_number.tr(),
                        LocaleKeys.engine_volume.tr(),
                        LocaleKeys.Min_trunk_volume.tr(),
                        LocaleKeys.Drive_unit.tr(),
                        LocaleKeys.engine_type.tr(),
                        LocaleKeys.Ground_clearance.tr(),
                        LocaleKeys.Acceleration_to_100_kmh.toString(),
                        LocaleKeys.Engine_power.tr(),
                        LocaleKeys.Curb_weight.tr(),
                        LocaleKeys.Fuel_consumption_per_100_km.tr(),
                        LocaleKeys.Transmission.tr(),
                        LocaleKeys.body_type.tr(),
                      ],
                      list: const [
                        '7',
                        '1591 куб.см',
                        '433 л',
                        'Полный',
                        'Бензин',
                        '190 мм',
                        '8.4 с',
                        '177 л.с.',
                        '1425 кг',
                        '7.6 л',
                        'Роботизированная',
                        'Внедорожник 5 дв.',
                      ],
                      title: 'Объём и масса',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.all_params.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(
                          AppIcons.chevronDown,
                          color: purple,
                        )
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      );
}
