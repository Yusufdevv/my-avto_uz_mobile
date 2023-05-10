
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FromFront extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;
  final double width;
  final Size imageSize;
  final double imageWidth;
  final double k;

  FromFront(
      {required this.width,
      required this.damagedParts,
      required this.onPressed,
      required this.imageSize,
      required this.k,
      Key? key})
      : imageWidth =k * imageSize.width,
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
                  AppIcons.carFromFront,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: k > 1.6
                    ? const Alignment(0, -.85)
                    : const Alignment(0, -1.2),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.roof],
                  onTap: () {
                    onPressed(DamagedPart.roof);
                  },
                ),
              ),
              Align(
                alignment: const Alignment(0, -.1),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.hood],
                  onTap: () {
                    onPressed(DamagedPart.hood);
                  },
                ),
              ),
              Align(
                alignment:
                    k > 1.6 ? const Alignment(0, .6) : const Alignment(0, .8),
                child: DamageButton(
                  k: k,
                  damageType: damagedParts[DamagedPart.frontBumper],
                  onTap: () {
                    onPressed(DamagedPart.frontBumper);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
