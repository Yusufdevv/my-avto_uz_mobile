import 'package:flutter/material.dart';

class OnBoardingItems extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final bool hasSecondText;
  final String secondText;
  final String thirdText;

  const OnBoardingItems({
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
          const Spacer(flex: 92),
          // SizedBox(height: 92),
          Expanded(
            flex: 384,
            child: Image.asset(
              image,
              width: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
            ),
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(child: Image.asset(icon)),
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
          const Spacer(flex: 24)
        ],
      );
}
