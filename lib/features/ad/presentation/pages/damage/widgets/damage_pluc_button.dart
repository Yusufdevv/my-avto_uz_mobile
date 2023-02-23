import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageButton extends StatelessWidget {
  final DamageType? damageType;
  final VoidCallback? onTap;
  final bool placedOnCar;

  const DamageButton({
    this.onTap,
    this.damageType,
    this.placedOnCar = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: damageType == null
            ? Container(
                height: 18,
                width: 18,
                margin: EdgeInsets.all(placedOnCar ? 5 : 0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffE5E5E5),
                          offset: Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: 0)
                    ]),
                child: Center(child: SvgPicture.asset(AppIcons.plus)))
            : Container(
                height: 18,
                width: 18,
                margin: EdgeInsets.all(placedOnCar ? 5 : 0),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyFunctions.getStatusColor(damageType),
                ),
                child: damageType == DamageType.ideal
                    ? Center(
                        child: SvgPicture.asset(AppIcons.check, color: white))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            height: 6,
                            width: 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                                color: white),
                          ),
                          Container(
                            height: 2,
                            width: 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                                color: white),
                          ),
                        ],
                      ),
              ),
      );
}
