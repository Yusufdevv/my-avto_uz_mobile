import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YearItem extends StatelessWidget {
  final String year;
  final bool isSelected;

  const YearItem({required this.year, required this.isSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16),
        color: isSelected
            ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
            : Colors.transparent,
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(right: 16, top: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: year.substring(0, year.length - 2),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .greySuitToWhite60),
                    ),
                    TextSpan(
                      text: year.substring(year.length - 2),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (isSelected)
                SvgPicture.asset(
                  AppIcons.check,
                  color: orange,
                  height: 14,
                ),
            ],
          ),
        ),
      );
}
