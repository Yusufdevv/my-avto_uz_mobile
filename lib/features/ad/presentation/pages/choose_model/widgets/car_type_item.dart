import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarTypeItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;

  const CarTypeItem(
      {required this.title,
      required this.isSelected,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          color: isSelected
              ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
              : Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                      if (isSelected)
                        SvgPicture.asset(
                          AppIcons.check,
                          color: orange,
                          height: 14,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
