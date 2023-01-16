import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/hight_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModelItems extends StatelessWidget {
  final String entity;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  final bool hasBorder;
  const ModelItems({
    required this.entity,
    required this.isSelected,
    required this.text,
    required this.onTap,
    this.hasBorder = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          color: isSelected
              ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
              : Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: hasBorder
                  ? Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                    )
                  : null,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HighlightedText(
                        allText: entity,
                        highlightedText: '',
                        terms: text.split(' '),
                        highlightColor:
                            const Color.fromARGB(255, 249, 228, 145),
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                        textStyleHighlight:
                            Theme.of(context).textTheme.headline1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
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
