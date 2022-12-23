import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/profile/presentation/widgets/scrolled_bottomsheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseRegionsheet extends StatefulWidget {
  const ChooseRegionsheet({super.key});

  @override
  State<ChooseRegionsheet> createState() => _ChooseRegionsheetState();
}

class _ChooseRegionsheetState extends State<ChooseRegionsheet> {
  bool allRegion = false;
  bool regionSelected = false;
  List regions = [
    'Андижанская область',
    'Бухарская область',
    'Джизакская область',
    'Кашкадарьинская область',
    'Навоийская область',
    'Наманганская область',
    'Самаркандская область',
    'Сурхандарьинская область',
    'Сырдарьинская область',
    'Ташкентская область',
  ];
  @override
  Widget build(BuildContext context) => ScrolledBottomSheet(
        title: 'Регион',
        hasHeader: true,
        children: [
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Все регион',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    allRegion = true;
                  }),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: orange),
                    ),
                    child: Center(
                      child: Text(
                        allRegion ? '+' : '-',
                        style: const TextStyle(color: orange),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    regions[index],
                    style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      regionSelected = true;
                    }),
                    child: WCheckBox(
                      isChecked: allRegion ? true : regionSelected,
                      checkBoxColor: orange,
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              indent: 16,
              height: 0,
            ),
            itemCount: regions.length,
          ),
          WButton(
            onTap: () => Navigator.pop(context),
            height: 44,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            text: LocaleKeys.apply.tr(),
          ),
        ],
      );
}
