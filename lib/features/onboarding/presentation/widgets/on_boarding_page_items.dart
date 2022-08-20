import 'package:auto/features/login/presentation/pages/login_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class OnBoardingItems extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final bool hasSecondText;
  final String secondText;
  final String thirdText;

  const OnBoardingItems(
      {required this.icon,
      this.secondText = '',
      this.thirdText = '',
      this.hasSecondText = false,
      required this.title,
      required this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 32,
                left: 32,
                top: MediaQuery.of(context).padding.top + 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(fade(page: const LoginScreen()));
                  },
                  child: Text(
                    'Пропустить',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
            ),
          ),
          Expanded(child: Image.asset(image,width: double.maxFinite,),),
          Padding(
            padding: const EdgeInsets.only(left: 32),
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
          const SizedBox(
            height: 24,
          ),
        ],
      );
}
