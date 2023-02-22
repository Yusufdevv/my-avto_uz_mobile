import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnDamageButtonPressed = Function(DamagedParts part);

class DamageCarsItem extends StatelessWidget {
  final OnDamageButtonPressed onPressed;
  final Map<DamagedParts, DamageType> damagedParts;

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
                        damageType: damagedParts[DamagedParts.frontLeftFender],
                        onTap: () {
                          onPressed(DamagedParts.frontLeftFender);
                        }),
                  ),
                  Positioned(
                    left: 110,
                    bottom: 32,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.leftFrontDoor],
                        onTap: () {
                          onPressed(DamagedParts.leftFrontDoor);
                        }),
                  ),
                  Positioned(
                    right: 87,
                    bottom: 32,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.leftRearDoor],
                        onTap: () {
                          onPressed(DamagedParts.leftRearDoor);
                        }),
                  ),
                  Positioned(
                    right: 32,
                    top: 22,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rearLeftFender],
                        onTap: () {
                          onPressed(DamagedParts.rearLeftFender);
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
                        damageType: damagedParts[DamagedParts.roof],
                        onTap: () {
                          onPressed(DamagedParts.roof);
                        }),
                  ),
                  Positioned(
                    top: 25,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.hood],
                        onTap: () {
                          onPressed(DamagedParts.hood);
                        }),
                  ),
                  Positioned(
                    bottom: 11,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.frontBumper],
                        onTap: () {
                          onPressed(DamagedParts.frontBumper);
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
                        damageType: damagedParts[DamagedParts.trunk],
                        onTap: () {
                          onPressed(DamagedParts.trunk);
                        }),
                  ),
                  Positioned(
                    bottom: 11,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rearBumper],
                        onTap: () {
                          onPressed(DamagedParts.rearBumper);
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
                        damageType: damagedParts[DamagedParts.rearRightFender],
                        onTap: () {
                          onPressed(DamagedParts.rearRightFender);
                        }),
                  ),
                  Positioned(
                    left: 90,
                    bottom: 34,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rightRearDoor],
                        onTap: () {
                          onPressed(DamagedParts.rightRearDoor);
                        }),
                  ),
                  Positioned(
                    right: 111,
                    bottom: 34,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rightFrontDoor],
                        onTap: () {
                          onPressed(DamagedParts.rightFrontDoor);
                        }),
                  ),
                  Positioned(
                    right: 47,
                    top: 22,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.frontRightFender],
                        onTap: () {
                          onPressed(DamagedParts.frontRightFender);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
