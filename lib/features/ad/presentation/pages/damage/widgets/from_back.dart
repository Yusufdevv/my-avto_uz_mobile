import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FromBack extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;

  const FromBack(
      {required this.damagedParts, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.carFromBack,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 19,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.trunk],
                  onTap: () {
                    onPressed(DamagedPart.trunk);
                  }),
            ),
            Positioned(
              bottom: 11,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.rearBumper],
                  onTap: () {
                    onPressed(DamagedPart.rearBumper);
                  }),
            ),
          ],
        ),
      );
}
