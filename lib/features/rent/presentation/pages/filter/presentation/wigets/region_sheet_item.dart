import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegionSheetItem extends StatelessWidget {
  final bool isChecked;
  final bool hasBorder;
  final String title;
  final bool isProfileEdit;

  const RegionSheetItem(
      {required this.title,
      required this.hasBorder,
      required this.isChecked,
      this.isProfileEdit = false,
      super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        decoration: BoxDecoration(
          color: isChecked ? snow : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            if (isProfileEdit)
              isChecked
                  ? SvgPicture.asset(
                      AppIcons.check,
                      color: orange,
                    )
                  : const SizedBox()
            else
              RegionCheckBox(
                isChecked: isChecked,
              )
          ],
        ),
      );
}
