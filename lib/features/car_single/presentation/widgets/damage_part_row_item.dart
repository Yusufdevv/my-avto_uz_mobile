import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/information_about_doors.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DamagePartRowItem extends StatelessWidget {
  final DamagedPartsAsEnum firstItem;
  final DamagedPartsAsEnum? secondItem;
  final bool hasDivider;

  const DamagePartRowItem(
      {required this.firstItem,
      required this.secondItem,
      required this.hasDivider,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InformationAboutDoors(
                  damageType: firstItem.type,
                  partName: MyFunctions.getDamagedPartName(firstItem.part),
                  damageName: MyFunctions.getStatusTitle(firstItem.type).tr(),
                ),
              ),
              if (secondItem == null)
                const SizedBox()
              else
                Expanded(
                  child: InformationAboutDoors(
                    damageType: secondItem!.type,
                    partName: MyFunctions.getDamagedPartName(secondItem!.part),
                    damageName:
                        MyFunctions.getStatusTitle(secondItem!.type).tr(),
                  ),
                ),
              const SizedBox(width: 16)
            ],
          ),
          if (hasDivider) const Divider(height: 24)
        ],
      );
}
