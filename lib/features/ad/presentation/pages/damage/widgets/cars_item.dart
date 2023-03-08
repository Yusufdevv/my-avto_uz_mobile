import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnDamageButtonPressed = Function(DamagedPart part);

class DamageCarsItem extends StatelessWidget {
  final OnDamageButtonPressed onPressed;
  final Map<DamagedPart, DamageType> damagedParts;

  const DamageCarsItem(
      {required this.onPressed, required this.damagedParts, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Center(
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
            ),
            const SizedBox(height: 32),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.carFromFront,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: -2,
                    child: DamageButton(
                        damageType: damagedParts[DamagedPart.roof],
                        onTap: () {
                          onPressed(DamagedPart.roof);
                        }),
                  ),
                  Positioned(
                    top: 25,
                    child: DamageButton(
                        damageType: damagedParts[DamagedPart.hood],
                        onTap: () {
                          onPressed(DamagedPart.hood);
                        }),
                  ),
                  Positioned(
                    bottom: 11,
                    child: DamageButton(
                        damageType: damagedParts[DamagedPart.frontBumper],
                        onTap: () {
                          onPressed(DamagedPart.frontBumper);
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Center(
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
            ),
            const SizedBox(height: 32),
            Center(
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
            ),
          ],
        ),
      );
}
