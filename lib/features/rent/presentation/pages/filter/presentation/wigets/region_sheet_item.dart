import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_checkbox.dart';
import 'package:flutter/material.dart';

class RegionSheetItem extends StatelessWidget {
  final bool isChecked;
  final bool hasBorder;
  final bool isMultiChoice;
  final String title;

  const RegionSheetItem(
      {required this.title,
      required this.hasBorder,
      required this.isChecked,
      required this.isMultiChoice,
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
           RegionCheckBox(
                isMultiChoice: isMultiChoice,
                isChecked: isChecked,
              )
          ],
        ),
      );
}
