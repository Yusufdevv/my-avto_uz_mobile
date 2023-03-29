import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FromRight extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;

  const FromRight(
      {required this.damagedParts, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          children: [
            SvgPicture.asset(
              AppIcons.carFromRight,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 34,
              top: 22,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.rearRightFender],
                  onTap: () {
                    onPressed(DamagedPart.rearRightFender);
                  }),
            ),
            Positioned(
              left: 90,
              bottom: 34,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.rightRearDoor],
                  onTap: () {
                    onPressed(DamagedPart.rightRearDoor);
                  }),
            ),
            Positioned(
              right: 111,
              bottom: 34,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.rightFrontDoor],
                  onTap: () {
                    onPressed(DamagedPart.rightFrontDoor);
                  }),
            ),
            Positioned(
              right: 47,
              top: 22,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.frontRightFender],
                  onTap: () {
                    onPressed(DamagedPart.frontRightFender);
                  }),
            ),
          ],
        ),
      );
}
