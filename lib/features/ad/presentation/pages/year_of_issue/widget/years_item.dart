import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YearItem extends StatelessWidget {
  final String beginYear;
  final String endYear;
  final bool isSelected;

  const YearItem(
      {required this.beginYear,
      required this.endYear,
      required this.isSelected,
      Key? key})
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
                  text: TextSpan(children: [
                TextSpan(
                  text: beginYear.substring(0, beginYear.length - 2),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400, color: grey),
                ),
                TextSpan(
                  text: beginYear.substring(beginYear.length - 2),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: ' - ',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ])),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: endYear.substring(0, beginYear.length - 2),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400, color: grey),
                ),
                TextSpan(
                  text: endYear.substring(beginYear.length - 2),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ])),
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
