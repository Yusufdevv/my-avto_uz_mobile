import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';



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
  Widget build(BuildContext context) => Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImages.carFromLeft),
                Positioned(
                  left: 54,
                  top: 27,
                  child: DamagePlucButton(onTap: onLeftFender(DamagedParts.rearLeftFender)),
                ),
                Positioned(
                  left: 115,
                  bottom: 37,
                  child: DamagePlucButton(onTap: onLeftFrontDoor(DamagedParts.leftFrontDoor)),
                ),
                Positioned(
                  right: 92,
                  bottom: 37,
                  child: DamagePlucButton(onTap: onLeftRearDoor(DamagedParts.rightRearDoor)),
                ),
                Positioned(
                  right: 37,
                  top: 27,
                  child: DamagePlucButton(onTap: onRearLetfFender(DamagedParts.rearLeftFender)),
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
                  right: 54,
                  left: 54,
                  top: 3,
                  child: DamagePlucButton(onTap: onRoof(DamagedParts.roof)),
                ),
                Positioned(
                  right: 54,
                  left: 54,
                  top: 30,
                  child: DamagePlucButton(onTap: onHood(DamagedParts.hood)),
                ),
                Positioned(
                  right: 54,
                  left: 54,
                  bottom: 16,
                  child: DamagePlucButton(onTap: onFrontBumper(DamagedParts.frontBumper)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Stack(
              children: [
                Image.asset(AppImages.carFromBack),
                Positioned(
                  right: 50,
                  left: 50,
                  top: 24,
                  child: DamagePlucButton(onTap: onTrunk(DamagedParts.trunk)),
                ),
                Positioned(
                  right: 50,
                  left: 50,
                  bottom: 16,
                  child: DamagePlucButton(onTap: onRearBumper(DamagedParts.rearBumper)),
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
                  child: DamagePlucButton(onTap: onRearRightFender(DamagedParts.rearRightFender)),
                ),
                Positioned(
                  left: 95,
                  bottom: 39,
                  child: DamagePlucButton(onTap: onRightRearDoor(DamagedParts.rightRearDoor)),
                ),
                Positioned(
                  right: 116,
                  bottom: 39,
                  child: DamagePlucButton(onTap: onRigthFrontDoor(DamagedParts.rightFrontDoor)),
                ),
                Positioned(
                  right: 52,
                  top: 27,
                  child: DamagePlucButton(onTap: onRearRightFender(DamagedParts.rearRightFender)),
                ),
              ],
            ),
          ),
        ],
      );
}
