import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/widgets/base_onboarding.dart';
import 'package:auto/features/onboarding/presentation/widgets/indicator.dart';
import 'package:auto/features/onboarding/presentation/widgets/on_boarding_page_items.dart';
import 'package:auto/features/onboarding/presentation/widgets/uz_on_boarding_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  Indicator indicator = const Indicator(
    isActive: true,
  );
  Indicator indicator2 = const Indicator(
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

  bool isLangRus() {
    final res = StorageRepository.getString('language') == 'ru' ? true : false;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    setOnboardingTrue();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 36),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WScaleAnimation(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(AppIcons.arrowLeft, color: black),
                  ),
                  const Spacer(),
                  if (currentIndex != 2)
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(fade(page: const LoginScreen()));
                        },
                        child: Text(
                          LocaleKeys.skip.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                        )),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (page) {
                    setState(() {
                      currentIndex = page;
                    });
                  },
                  children: [
                    OnBoardingPageItems(
                        icon: AppImages.flash,
                        title: LocaleKeys.easy_send.tr(),
                        image: AppImages.firstImage),
                    OnBoardingPageItems(
                        icon: AppImages.done,
                        title: LocaleKeys.trusted_car_dealers.tr(),
                        image: AppImages.secondImage),
                    if (isLangRus())
                      OnBoardingPageItems(
                        icon: AppImages.omg,
                        title: LocaleKeys.more_than.tr(),
                        secondText: ' 10 000 ',
                        image: AppImages.thirdImage,
                        thirdText: LocaleKeys.offers.tr(),
                      )
                    else
                      UzOnBoardingPageItems(
                          icon: AppImages.omg,
                          title: LocaleKeys.more_than.tr(),
                          image: AppImages.thirdImage,
                          secondText: '10 000 ',
                          thirdText: LocaleKeys.offers.tr()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Row(
                children: buildIndicator(),
              ),
            ),
            const SizedBox(height: 32),
            BaseOnBoarding(
              onTap: () => Navigator.pushAndRemoveUntil(
                  context, fade(page: const LoginScreen()), (route) => false),
              color: currentIndex == 1 && currentIndex == 2
                  ? Theme.of(context)
                      .extension<ThemedColors>()!
                      .veryLightGreyToEclipse
                  : orange,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setOnboardingTrue() async {
    await StorageRepository.putBool(key: 'onboarding', value: true);
  }
}
