import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_checkbox.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegionSelectAllItem extends StatelessWidget {
  final bool isAllChecked;
  final VoidCallback onTap;

  const RegionSelectAllItem({
    required this.onTap,
    required this.isAllChecked,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Theme.of(context).extension<ThemedColors>()!.divider),
          ),
        ),
        child: WScaleAnimation(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.all_regions.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              if (isAllChecked)
                const RegionCheckBox(isMultiChoice: true, isChecked: true)
              else
                Container(
                  alignment: Alignment.center,
                  height: 20.28,
                  width: 20.28,
                  decoration: BoxDecoration(
                    border: Border.all(color: orange, width: 1.8),
                    borderRadius: BorderRadius.circular(5.57),
                  ),
                  child: Container(
                    height: 2,
                    width: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1), color: orange),
                  ),
                )
            ],
          ),
        ),
      );
}
