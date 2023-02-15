import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingBottom extends StatefulWidget {
  const OnBoardingBottom({Key? key}) : super(key: key);

  @override
  State<OnBoardingBottom> createState() => _OnBoardingBottomState();
}

class _OnBoardingBottomState extends State<OnBoardingBottom> {
  int index = 0;
  @override
  Widget build(BuildContext context) => Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      LocaleKeys.hello.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
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
                      text: LocaleKeys.build_plans.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 32, fontWeight: FontWeight.w700),
                      children: [
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Image.asset(AppImages.magic),
                        ))
                      ]),
                ),
                const SizedBox(height: 37),
                Row(
                  children: [
                    //O‘zbekcha btn
                    Expanded(
                      child: WButton(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                          context.setLocale(const Locale('uz'));
                          serviceLocator<DioSettings>()
                              .setBaseOptions(lang: 'uz');
                          StorageRepository.putString('language', 'uz');
                        },
                        color: index == 0
                            ? orange
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToCharcoal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // o'zb btn
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(AppIcons.uzbekistan2)),
                            const SizedBox(width: 4),
                            Text(
                              'O‘zbekcha',
                              style: index == 0
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: white)
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .greySuitToWhite),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    //rus btn
                    Expanded(
                      child: WButton(
                        color: index == 1
                            ? orange
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToCharcoal,
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                          context.setLocale(const Locale('ru'));
                          serviceLocator<DioSettings>()
                              .setBaseOptions(lang: 'ru');
                          StorageRepository.putString('language', 'ru');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(AppIcons.russian2)),
                            const SizedBox(width: 4),
                            Text(
                              'Русский',
                              style: index == 1
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: white)
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .greySuitToWhite),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: WScaleAnimation(
              onTap: () {
                if (index == 0) {
                  context.setLocale(const Locale('uz'));
                  serviceLocator<DioSettings>().setBaseOptions(lang: 'uz');
                  StorageRepository.putString('language', 'uz');
                }
                Navigator.of(context)
                    .push(fade(page: const OnBoardingScreen()));
              },
              child: Stack(
                children: [
                  SvgPicture.asset(AppIcons.orangePolygon),
                  Positioned(
                      right: 10,
                      top: 110,
                      child: SvgPicture.asset(AppIcons.arrowRight)),
                ],
              ),
            ),
          ),
        ],
      );
}
