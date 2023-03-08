import 'dart:developer';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/car_status_icon_on_single.dart';
import 'package:auto/features/car_single/presentation/widgets/information_about_doors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarCharacteristicImage extends StatefulWidget {
  final List<DamagedPartsEntity> informAboutDoors;

  const CarCharacteristicImage({required this.informAboutDoors, Key? key})
      : super(key: key);

  @override
  State<CarCharacteristicImage> createState() => _CarCharacteristicImageState();
}

class _CarCharacteristicImageState extends State<CarCharacteristicImage> {
  late int length;
  late List<DamagedPartsAsEnum> asEnum;

  @override
  void initState() {
    asEnum = widget.informAboutDoors.map((e) => e.toEnum()).toList();

    // asEnum = List.generate(
    //     DamagedPart.values.length,
    //     (index) => DamagedPartsAsEnum(
    //         part: DamagedPart.values[index],
    //         type: DamageType.values[index % 5]));
    length = countLength(asEnum.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              // color: Colors.teal,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
          ),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.auto_characters.tr(),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 18),
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.doubleCheck),
              const SizedBox(width: 4),
              Text(
                LocaleKeys.checked_by_autouz.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Center(
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppIcons.autoModel,
                  fit: BoxFit.cover,
                ),
                ...List.generate(
                  asEnum.length,
                  (index) => CarStatusIconInPicture(
                    type: asEnum[index].type,
                    position: MyFunctions.getDamagePosition(
                      part: asEnum[index].part,
                      width: width,
                      height: height,
                    ),
                  ),
                ).toList(),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InformationAboutDoors(
                    damageType: asEnum[countIndex(index)].type,
                    partName: MyFunctions.getDamagedPartName(
                        asEnum[countIndex(index)].part),
                    damageName: MyFunctions.getStatusTitle(
                            asEnum[countIndex(index)].type)
                        .tr(),
                  ),
                ),
                if (index == length - (length.isEven ? 0 : 1))
                  const SizedBox()
                else
                  Expanded(
                    child: InformationAboutDoors(
                      damageType: asEnum[countIndex(index) + 1].type,
                      partName: MyFunctions.getDamagedPartName(
                          asEnum[countIndex(index) + 1].part),
                      damageName: MyFunctions.getStatusTitle(
                              asEnum[countIndex(index) + 1].type)
                          .tr(),
                    ),
                  ),
              ],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: length,
          )
        ],
      ),
    );
  }

  int countIndex(int v) => v == 0 ? 0 : v * 2;

  int countLength(int v) => v.isEven ? v ~/ 2 : (v ~/ 2) + 1;
}
