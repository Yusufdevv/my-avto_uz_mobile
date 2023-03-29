import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FromRight extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;
  final double width;
  final Size imageSize;
  final double imageWidth;
  final double k;

  FromRight(
      {required this.width,
      required this.damagedParts,
      required this.onPressed,
      required this.imageSize,
      required this.k,
      Key? key})
      : imageWidth = k * imageSize.width,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        alignment: Alignment.center,
        child: SizedBox(
          height: (imageWidth * imageSize.height) / imageSize.width,
          width: imageWidth,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AppIcons.carFromRight,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const Alignment(-.8, -.3),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.rearRightFender],
                  onTap: () {
                    onPressed(DamagedPart.rearRightFender);
                  },
                ),
              ),
              Align(
                alignment: const Alignment(-.3, 0),
                child: DamageButton(
                    k: k,
                    damageType: damagedParts[DamagedPart.rightRearDoor],
                    onTap: () {
                      onPressed(DamagedPart.rightRearDoor);
                    }),
              ),
              Align(
                alignment: const Alignment(.15, 0),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.rightFrontDoor],
                  onTap: () {
                    onPressed(DamagedPart.rightFrontDoor);
                  },
                ),
              ),
              Align(
                alignment: const Alignment(.65, -.3),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.frontRightFender],
                  onTap: () {
                    onPressed(DamagedPart.frontRightFender);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
