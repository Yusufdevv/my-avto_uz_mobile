import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingInfoItem extends StatelessWidget {
  const RatingInfoItem({
    required this.title,
    required this.activeStarCount,
    this.starsCount = 5,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    Key? key,
  }) : super(key: key);
  final String title;
  final int activeStarCount;
  final int starsCount;
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
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            SizedBox(
              height: 16,
              child: ListView.builder(
                itemCount: starsCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SvgPicture.asset(
                  AppIcons.star,
                  color: index < activeStarCount ? null : dividerColor,
                ),
              ),
            ),
          ],
        ),
      );
}
