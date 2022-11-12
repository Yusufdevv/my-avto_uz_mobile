import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/add_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewBottomSheetItem extends StatelessWidget {
  const ReviewBottomSheetItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.hasDivider = true,
    this.iconWidth,
    this.iconHeight,
    Key? key,
  }) : super(key: key);
  final String title;
  final String icon;
  final bool hasDivider;
  final VoidCallback onTap;
  final double? iconWidth;
  final double? iconHeight;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          WButton(
            height: 52,
            color: white,
            onTap: onTap,
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: iconWidth,
                  height: iconHeight,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                )
              ],
            ),
          ),
          if (hasDivider)
            const Divider(color: border, height: 1, thickness: 1)
          else
            const SizedBox(),
        ],
      );
}
