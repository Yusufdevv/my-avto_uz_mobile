import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegionSelectAllItem extends StatelessWidget {
  final bool isAllChecked;
  final VoidCallback onTap;
  final bool isOtherPage;

  const RegionSelectAllItem({
    required this.onTap,
    required this.isAllChecked,
    required this.isOtherPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: border))),
        child: WScaleAnimation(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Все регион',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              if (isOtherPage)
                isAllChecked
                    ? SvgPicture.asset(
                        AppIcons.check,
                        color: orange,
                      )
                    : const SizedBox()
              else if (isAllChecked)
                const RegionCheckBox(
                  isChecked: true,
                )
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
