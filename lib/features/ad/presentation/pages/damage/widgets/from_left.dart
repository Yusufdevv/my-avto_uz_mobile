import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnDamageButtonPressed = Function(DamagedPart part);

class FromLeft extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;
  final Size imageSize;
  final double width;
  final double imageWidth;
  final double k;

  FromLeft(
      {required this.width,
      required this.onPressed,
      required this.damagedParts,
      required this.imageSize,
      required this.k,
      Key? key})
      : imageWidth = k * imageSize.width,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: width,
        child: SizedBox(
          height: (imageWidth * imageSize.height) / imageSize.width,
          width: imageWidth,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AppIcons.carFromLeft,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: const Alignment(-.7, -.2),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.frontLeftFender],
                  onTap: () {
                    onPressed(DamagedPart.frontLeftFender);
                  },
                ),
              ),
              Align(
                alignment: const Alignment(-.1, 0),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.leftFrontDoor],
                  onTap: () {
                    onPressed(DamagedPart.leftFrontDoor);
                  },
                ),
              ),
              Align(
                alignment: const Alignment(.3, 0),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.leftRearDoor],
                  onTap: () {
                    onPressed(DamagedPart.leftRearDoor);
                  },
                ),
              ),
              Align(
                alignment: const Alignment(.8, -.3),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.rearLeftFender],
                  onTap: () {
                    onPressed(DamagedPart.rearLeftFender);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
