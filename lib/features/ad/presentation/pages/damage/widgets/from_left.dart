import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnDamageButtonPressed = Function(DamagedPart part);

class FromLeft extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;

  const FromLeft(
      {required this.onPressed,
      required this.damagedParts,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.carFromLeft,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 49,
              top: 22,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.frontLeftFender],
                  onTap: () {
                    onPressed(DamagedPart.frontLeftFender);
                  }),
            ),
            Positioned(
              left: 110,
              bottom: 32,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.leftFrontDoor],
                  onTap: () {
                    onPressed(DamagedPart.leftFrontDoor);
                  }),
            ),
            Positioned(
              right: 87,
              bottom: 32,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.leftRearDoor],
                  onTap: () {
                    onPressed(DamagedPart.leftRearDoor);
                  }),
            ),
            Positioned(
              right: 32,
              top: 22,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.rearLeftFender],
                  onTap: () {
                    onPressed(DamagedPart.rearLeftFender);
                  }),
            ),
          ],
        ),
      );
}
