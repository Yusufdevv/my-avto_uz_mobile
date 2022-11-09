import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/add_review_screen.dart';
import 'package:auto/features/reviews/presentation/pages/select_brand_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewBottomSheetItem extends StatelessWidget {
  const ReviewBottomSheetItem({
    required this.title,
    required this.icon,
    this.hasDivider = true,
    Key? key,
  }) : super(key: key);
  final String title;
  final String icon;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          WButton(
            height: 52,
            color: white,
            child: Row(
              children: [
                SvgPicture.asset(icon),
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
            onTap: () {
              Navigator.push(context, fade(page: const AddReviewScreen()));
            },
          ),
          if (hasDivider)
            const Divider(color: border, height: 1, thickness: 1)
          else
            const SizedBox(),
        ],
      );
}
