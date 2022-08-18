import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/characteristic_table.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/equipment.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
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
        color: background,
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
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToSmoky),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  tabs: const [
                    Tab(
                      text: 'Описание',
                    ),
                    Tab(
                      text: 'Характеристика',
                    ),
                  ]),
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
                ],
              )
            else
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                child: Column(
                  children:  [
                    const CharacteristicTable(
                      titleList: [
                        'zokir0',
                        'zokir1',
                        'zokir2',
                        'zokir3',
                        'zokir4',
                        'zokir5',
                        'zokir6',
                        'zokir7',
                        'zokir8',
                        'zokir9',
                        'zokir10',
                        'zokir11',
                      ],
                      list: [
                        'Роботизированная',
                        'Роботизированная',
                        'Роботизированная',
                        'ui3',
                        'ui4',
                        'ui5',
                        'ui6',
                        'ui7',
                        'ui8',
                        'ui9',
                        'ui10',
                        'ui11',
                      ],
                      title: 'Helloo',
                    ),
                    const CharacteristicTable(
                      titleList: [
                        'zokir0',
                        'zokir1',
                        'zokir2',
                        'zokir3',
                        'zokir4',
                        'zokir5',
                        'zokir6',
                        'zokir7',
                        'zokir8',
                        'zokir9',
                        'zokir10',
                        'zokir11',
                      ],
                      list: [
                        'ui0',
                        'ui1',
                        'ui2',
                        'ui3',
                        'ui4',
                        'ui5',
                        'ui6',
                        'ui7',
                        'ui8',
                        'ui9',
                        'ui10',
                        'ui11',
                      ],
                      title: 'Helloo',
                    ),
                    const CharacteristicTable(
                      titleList: [
                        'zokir0',
                        'zokir1',
                        'zokir2',
                        'zokir3',
                        'zokir4',
                        'zokir5',
                        'zokir6',
                        'zokir7',
                        'zokir8',
                        'zokir9',
                        'zokir10',
                        'zokir11',
                      ],
                      list: [
                        'ui0',
                        'ui1',
                        'ui2',
                        'ui3',
                        'ui4',
                        'ui5',
                        'ui6',
                        'ui7',
                        'ui8',
                        'ui9',
                        'ui10',
                        'ui11',
                      ],
                      title: 'Helloo',
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Все параметры', style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),),
                        const SizedBox(width: 4,),
                        SvgPicture.asset(AppIcons.chevronDown, color: purple,)
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      );
}
