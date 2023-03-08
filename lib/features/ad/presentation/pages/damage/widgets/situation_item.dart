import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SituationItem extends StatelessWidget {
  final String position;
  final DamageType? damageType;
  final VoidCallback onTap;

  const SituationItem(
      {required this.damageType,
      required this.onTap,
      required this.position,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                WarningCircleWidget(damageType: damageType),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      position,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 14, color: grey),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      MyFunctions.getStatusTitle(damageType ?? DamageType.ideal).tr()
                          .tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  behavior: HitTestBehavior.opaque,
                  child: SvgPicture.asset(AppIcons.editProfile, height: 24),
                ),
                const SizedBox(width: 16)
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
          ],
        ),
      );
}
