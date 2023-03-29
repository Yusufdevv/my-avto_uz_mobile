import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:flutter/material.dart';

class InformationAboutDoors extends StatelessWidget {
  const InformationAboutDoors({
    required this.partName,
    required this.damageName,
    required this.damageType,
    required this.k,
    Key? key,
  }) : super(key: key);
  final DamageType damageType;
  final String partName;
  final String damageName;
  final double k;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: DamageButton(k: k, damageType: damageType)),
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
