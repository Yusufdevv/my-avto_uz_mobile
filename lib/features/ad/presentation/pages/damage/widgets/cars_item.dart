import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DamageCarsItem extends StatelessWidget {
  final Function(DamagedParts) onLeftFender;
  final Function(DamagedParts) onLeftFrontDoor;
  final Function(DamagedParts) onLeftRearDoor;
  final Function(DamagedParts) onRearLetfFender;
  //////////////////////
  final Function(DamagedParts) onRigthFrontDoor;
  final Function(DamagedParts) onRightRearDoor;
  final Function(DamagedParts) onFrontRightFender;
  final Function(DamagedParts) onRearRightFender;
  /////////////////////
  final Function(DamagedParts) onRearBumper;
  final Function(DamagedParts) onFrontBumper;
  final Function(DamagedParts) onRoof;
  final Function(DamagedParts) onHood;
  final Function(DamagedParts) onTrunk;

  const DamageCarsItem(
      {required this.onLeftFender,
      required this.onLeftFrontDoor,
      required this.onLeftRearDoor,
      required this.onRearLetfFender,
      required this.onRigthFrontDoor,
      required this.onRightRearDoor,
      required this.onFrontRightFender,
      required this.onRearRightFender,
      required this.onRearBumper,
      required this.onFrontBumper,
      required this.onRoof,
      required this.onHood,
      required this.onTrunk,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PostingAdBloc, PostingAdState>(
        builder: (context, state) => Column(
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
                        damageType:
                            state.damagedParts[DamagedParts.frontLeftFender],
                        onTap: () {
                          onLeftFender(DamagedParts.frontLeftFender);
                        }),
                  ),
                  Positioned(
                    left: 115,
                    bottom: 37,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.leftFrontDoor],
                        onTap: () {
                          onLeftFrontDoor(DamagedParts.leftFrontDoor);
                        }),
                  ),
                  Positioned(
                    right: 92,
                    bottom: 37,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.leftRearDoor],
                        onTap: () {
                          onLeftRearDoor(DamagedParts.leftRearDoor);
                        }),
                  ),
                  Positioned(
                    right: 37,
                    top: 27,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.rearLeftFender],
                        onTap: () {
                          onRearLetfFender(DamagedParts.rearLeftFender);
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
                        damageType: state.damagedParts[DamagedParts.roof],
                        onTap: () {
                          onRoof(DamagedParts.roof);
                        }),
                  ),
                  Positioned(
                    top: 30,
                    child: DamageButton(
                        damageType: state.damagedParts[DamagedParts.hood],
                        onTap: () {
                          onHood(DamagedParts.hood);
                        }),
                  ),
                  Positioned(
                    bottom: 16,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.frontBumper],
                        onTap: () {
                          onFrontBumper(DamagedParts.frontBumper);
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
                        damageType: state.damagedParts[DamagedParts.trunk],
                        onTap: () {
                          onTrunk(DamagedParts.trunk);
                        }),
                  ),
                  Positioned(
                    bottom: 16,
                    child: DamageButton(
                        damageType: state.damagedParts[DamagedParts.rearBumper],
                        onTap: () {
                          onRearBumper(DamagedParts.rearBumper);
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
                        damageType:
                            state.damagedParts[DamagedParts.rearRightFender],
                        onTap: () {
                          onRearRightFender(DamagedParts.rearRightFender);
                        }),
                  ),
                  Positioned(
                    left: 95,
                    bottom: 39,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.rightRearDoor],
                        onTap: () {
                          onRightRearDoor(DamagedParts.rightRearDoor);
                        }),
                  ),
                  Positioned(
                    right: 116,
                    bottom: 39,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.rightFrontDoor],
                        onTap: () {
                          onRigthFrontDoor(DamagedParts.rightFrontDoor);
                        }),
                  ),
                  Positioned(
                    right: 52,
                    top: 27,
                    child: DamageButton(
                        damageType:
                            state.damagedParts[DamagedParts.frontRightFender],
                        onTap: () {
                          onRearRightFender(DamagedParts.frontRightFender);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
