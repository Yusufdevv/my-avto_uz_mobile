import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class RatingInfoItem extends StatelessWidget {
  const RatingInfoItem({
    required this.title,
    required this.activeStarCount,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    Key? key,
  }) : super(key: key);
  final String title;
  final double activeStarCount;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          left: leftPadding,
          right: rightPadding,
          bottom: bottomPadding,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            SizedBox(
              height: 16,
              child: RatingBar.builder(
                itemBuilder: (context, index) =>
                    SvgPicture.asset(AppIcons.star),
                onRatingUpdate: (value) {},
                allowHalfRating: true,
                initialRating: activeStarCount,
                ignoreGestures: true,
                minRating: 0,
                itemSize: 16,
                maxRating: 5,
                itemPadding: const EdgeInsets.only(left: 2),
                unratedColor: dividerColor,
              ),
            ),
          ],
        ),
      );
}
