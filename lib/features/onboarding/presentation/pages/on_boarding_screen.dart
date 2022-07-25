import 'package:auto/assets/constants/images.dart';
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
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: [
                OnBoardingItems(
                    icon: AppImages.flash,
                    isLast: false,
                    indicator: buildIndicator(),
                    title: 'Легкая \nпродажа авто',
                    image: AppImages.firstImage),
                OnBoardingItems(
                    icon: AppImages.done,
                    isLast: false,
                    indicator: buildIndicator(),
                    title: 'Доверенные    автосалоны',
                    image: AppImages.secondImage),
                OnBoardingItems(
                  icon: AppImages.omg,
                  hasSecondText: true,
                  isLast: true,
                  indicator: buildIndicator(),
                  title: 'Более ',
                  secondText: '10 000',
                  image: AppImages.thirdImage,
                  thirdText: ' объявлений',
                ),
              ],
            ),
          ],
        )),
      );
}
