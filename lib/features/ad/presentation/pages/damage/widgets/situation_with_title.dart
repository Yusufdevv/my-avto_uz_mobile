import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: greyText),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              WarningCircleWidget(damageType: damageType),
              const SizedBox(width: 10),
              Text(
                MyFunctions.getStatusTitle(damageType??DamageType.ideal).tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
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
          const SizedBox(height: 20),
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
        ],
      );
}
