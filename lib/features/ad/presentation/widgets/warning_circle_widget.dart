import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WarningCircleWidget extends StatelessWidget {
  final DamageType? damageType;
  const WarningCircleWidget({
    required this.damageType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = MyFunctions.getStatusColor(damageType);

    return Container(
      padding: damageType == DamageType.ideal ? const EdgeInsets.all(4) : null,
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2.3,
          color: color,
        ),
      ),
      child: damageType == null
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                AppIcons.plus,
                color: color,
              ),
            )
          : damageType == DamageType.ideal
              ? SvgPicture.asset(
                  AppIcons.check,
                  color: color,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 2.2),
                      width: 2.4,
                      height: 7,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(1.2)),
                    ),
                    Container(
                      width: 2.4,
                      height: 2.4,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(1.2)),
                    ),
                  ],
                ),
    );
  }
}
