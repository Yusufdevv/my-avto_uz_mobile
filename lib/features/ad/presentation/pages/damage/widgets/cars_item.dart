import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';

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
                  Image.asset(AppImages.carFromLeft),
                  Positioned(
                    left: 54,
                    top: 27,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.frontLeftFender],
                        onTap: () {
                          onPressed(DamagedParts.frontLeftFender);
                        }),
                  ),
                  Positioned(
                    left: 115,
                    bottom: 37,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.leftFrontDoor],
                        onTap: () {
                          onPressed(DamagedParts.leftFrontDoor);
                        }),
                  ),
                  Positioned(
                    right: 92,
                    bottom: 37,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.leftRearDoor],
                        onTap: () {
                          onPressed(DamagedParts.leftRearDoor);
                        }),
                  ),
                  Positioned(
                    right: 37,
                    top: 27,
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
                  Image.asset(AppImages.carFromOpposite),
                  Positioned(
                    top: 3,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.roof],
                        onTap: () {
                          onPressed(DamagedParts.roof);
                        }),
                  ),
                  Positioned(
                    top: 30,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.hood],
                        onTap: () {
                          onPressed(DamagedParts.hood);
                        }),
                  ),
                  Positioned(
                    bottom: 16,
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
                  Image.asset(AppImages.carFromBack),
                  Positioned(
                    top: 24,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.trunk],
                        onTap: () {
                          onPressed(DamagedParts.trunk);
                        }),
                  ),
                  Positioned(
                    bottom: 16,
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
                  Image.asset(AppImages.carFromRight),
                  Positioned(
                    left: 39,
                    top: 27,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rearRightFender],
                        onTap: () {
                          onPressed(DamagedParts.rearRightFender);
                        }),
                  ),
                  Positioned(
                    left: 95,
                    bottom: 39,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rightRearDoor],
                        onTap: () {
                          onPressed(DamagedParts.rightRearDoor);
                        }),
                  ),
                  Positioned(
                    right: 116,
                    bottom: 39,
                    child: DamageButton(
                        damageType: damagedParts[DamagedParts.rightFrontDoor],
                        onTap: () {
                          onPressed(DamagedParts.rightFrontDoor);
                        }),
                  ),
                  Positioned(
                    right: 52,
                    top: 27,
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
