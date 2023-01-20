import 'package:flutter/material.dart';

class OnBoardingPageItems extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final bool hasSecondText;
  final String secondText;
  final String thirdText;

  const OnBoardingPageItems({
    required this.icon,
    required this.title,
    required this.image,
    this.secondText = '',
    this.thirdText = '',
    this.hasSecondText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(icon),
                )),
                TextSpan(
                  text: title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 36),
                ),
                TextSpan(
                    text: secondText,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 36, fontWeight: FontWeight.w700)),
                TextSpan(
                  text: thirdText,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 36),
                ),
              ]),
            ),
          ),
        ],
      );
}
