import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:auto/features/onboarding/presentation/widgets/language_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingBottom extends StatelessWidget {
  const OnBoardingBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Здравствуйте',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13, color: darkGray),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(AppImages.clap)
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Планы на автомобили постройте\nвместе с нами',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 32, fontWeight: FontWeight.w700),
                      children: [
                        WidgetSpan(child: Image.asset(AppImages.magic))
                      ]),
                ),
                const SizedBox(
                  height: 35,
                ),
                const LanguageItem()
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  orange.withOpacity(.03),
                  orange.withOpacity(.1),
                  orange.withOpacity(.01),
                ])),
          ),
          Positioned(
              right: 0,
              child: Stack(
                children: [
                  SvgPicture.asset(AppIcons.orangePolygon),
                  Positioned(
                      right: 10,
                      top: 110,
                      child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .push(fade(page: const OnBoardingScreen())),
                          child: SvgPicture.asset(
                            AppIcons.arrowRight,
                          ))),
                ],
              ))
        ],
      );
}
