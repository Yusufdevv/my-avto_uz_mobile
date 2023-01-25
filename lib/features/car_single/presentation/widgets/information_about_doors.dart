import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class InformationAboutDoors extends StatelessWidget {
  const InformationAboutDoors({
    required this.informAboutDoors,
    required this.index,
    Key? key,
  }) : super(key: key);

  final List<DamagedPartsEntity> informAboutDoors;
  final int index;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          MyFunctions.getStatusIcon(informAboutDoors[index].damageType),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyFunctions.getDoorName(informAboutDoors[index].part),
                style: const TextStyle(
                  color: grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Text(
                MyFunctions.getStatusTitle(informAboutDoors[index].damageType),
                style: TextStyle(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.darkToWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      );
}
