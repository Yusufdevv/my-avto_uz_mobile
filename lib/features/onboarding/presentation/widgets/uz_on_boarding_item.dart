import 'package:flutter/material.dart';

class UzOnBoardingPageItems extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final String secondText;
  final String thirdText;

  const UzOnBoardingPageItems({
    required this.icon,
    required this.title,
    required this.image,
    this.secondText = '',
    this.thirdText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
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
                  child:
                      SizedBox(height: 32, width: 32, child: Image.asset(icon)),
                )),
                TextSpan(
                    text: secondText,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 36, fontWeight: FontWeight.w700)),
                TextSpan(
                  text: title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 36),
                ),
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
      );
}
