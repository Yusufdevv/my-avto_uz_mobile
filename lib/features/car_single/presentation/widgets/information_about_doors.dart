import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class InformationAboutDoors extends StatelessWidget {
  const InformationAboutDoors({
    required this.partName,
    required this.damageName,
    Key? key,
  }) : super(key: key);
  final String partName;
  final String damageName;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: DamageButton(
                damageType: MyFunctions.stringToDamageType(damageName),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                partName,
                style: const TextStyle(
                  color: grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Text(
                damageName.length > 22
                    ? '${damageName.substring(0, 21).trim()}..'
                    : damageName,
                maxLines: 1,
                style: TextStyle(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .darkToWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          )
        ],
      );
}
