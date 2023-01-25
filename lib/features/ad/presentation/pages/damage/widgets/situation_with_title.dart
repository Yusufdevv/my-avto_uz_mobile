import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class SituationTitleItem extends StatelessWidget {
  final String title;
  final DamageType? damageType;
  final VoidCallback onTap;
  const SituationTitleItem(
      {required this.onTap,
      required this.damageType,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: greyText),
          ),
          const SizedBox(height: 16),
          WScaleAnimation(
            onTap: onTap,
            child: Row(
              children: [
                WarningCircleWidget(damageType: damageType),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  MyFunctions.getStatusTitle(damageType?.value ?? ''),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(height: 11),
          Divider(
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
        ],
      );
}
