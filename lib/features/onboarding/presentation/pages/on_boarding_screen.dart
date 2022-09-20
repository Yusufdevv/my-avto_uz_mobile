import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/widgets/base_onboarding.dart';
import 'package:auto/features/onboarding/presentation/widgets/indicator.dart';
import 'package:auto/features/onboarding/presentation/widgets/on_boarding_page_items.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  var indicator = const Indicator(
    isActive: true,
  );
  var indicator2 = const Indicator(
    isActive: false,
  );
  int currentIndex = 0;
  bool isVisible = false;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<Widget> buildIndicator() {
    final indicators = <Widget>[];

    for (var i = 0; i < 3; i++) {
      textVisibility();
      if (currentIndex == i) {
        indicators.add(indicator);
      } else {
        indicators.add(indicator2);
      }
    }
    return indicators;
  }

  void textVisibility() {
    setState(() {
      if (currentIndex == 1) {
        isVisible = true;
      } else {
        isVisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              onPageChanged: (page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: const [
                OnBoardingItems(
                    icon: AppImages.flash,
                    title: 'Легкая \nпродажа авто',
                    image: AppImages.firstImage),
                OnBoardingItems(
                    icon: AppImages.done,
                    title: 'Доверенные    автосалоны',
                    image: AppImages.secondImage),
                OnBoardingItems(
                  icon: AppImages.omg,
                  hasSecondText: true,
                  title: 'Более ',
                  secondText: '10 000',
                  image: AppImages.thirdImage,
                  thirdText: ' объявлений',
                ),
              ],
            ),
            Positioned(
              bottom: 16 + MediaQuery.of(context).padding.bottom,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Row(
                      children: buildIndicator(),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BaseOnBoarding(
                    onTap: currentIndex == 0 || currentIndex == 1
                        ? () {}
                        : () => Navigator.pushAndRemoveUntil(context,
                            fade(page: const LoginScreen()), (route) => false),
                    color: currentIndex == 1 && currentIndex == 2
                        ? Theme.of(context)
                            .extension<ThemedColors>()!
                            .veryLightGreyToEclipse
                        : orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
