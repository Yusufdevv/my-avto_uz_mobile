import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPageItems extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final String secondText;
  final String thirdText;
  final bool polygonIcon;
  final double? rightPosition;
  final double? bottomPosition;
  final double? topPosition;

  const OnBoardingPageItems({
    required this.icon,
    required this.title,
    required this.image,
    this.secondText = '',
    this.thirdText = '',
    this.polygonIcon = false,
    this.rightPosition,
    this.bottomPosition,
    this.topPosition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          if (polygonIcon)
            Positioned(
                right: rightPosition,
                bottom: bottomPosition,
                top: topPosition,
                child: SvgPicture.asset(AppIcons.purplePolygon)),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(child: Image.asset(image)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                          height: 32, width: 32, child: Image.asset(icon)),
                    )),
                    TextSpan(
                      text: title,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 36),
                    ),
                    TextSpan(
                        text: secondText,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 36, fontWeight: FontWeight.w700)),
                    TextSpan(
                      text: thirdText,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 36),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      );
}
