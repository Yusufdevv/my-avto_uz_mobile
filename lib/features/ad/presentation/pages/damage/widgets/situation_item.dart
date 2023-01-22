import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

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
            WScaleAnimation(
              onTap: onTap,
              child: Row(
                children: [
                  DamageButton(damageType: damageType),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        position,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14, color: grey),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        MyFunctions.getStatusTitle(damageType?.value ?? ''),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
          ],
        ),
      );
}
