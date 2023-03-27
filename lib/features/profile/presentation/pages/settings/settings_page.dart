import 'dart:developer';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/settings/password_changing_page.dart';
import 'package:auto/features/profile/presentation/widgets/theme_bottom_sheet.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final edit = <List<String>>[
    [
      LocaleKeys.change_password.tr(),
      LocaleKeys.language.tr(),
    ]
  ];

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, true);
          return false;
        },
        child: Scaffold(
          appBar: WAppBar(
            bottomRadius: 24,
            onTapBack: () {
              Navigator.pop(context, true);
            },
            textWithButton: LocaleKeys.settings.tr(),
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WScaleAnimation(
                      onTap: () {
                        Navigator.of(context).push(
                          fade(
                            page: const PasswordChangingPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToNero1,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.change_password.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                            ),
                            SvgPicture.asset(
                              AppIcons.chevronRightBlack,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .darkGreyToWhite,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    WScaleAnimation(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width),
                            builder: (context) => const ThemeBottomSheet());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToNero1,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Тема приложения',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  AppIcons.chevronRightBlack,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .darkGreyToWhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    WScaleAnimation(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width),
                            builder: (context) =>
                                const LanguageBottomSheet()).then(
                            (value) async {
                          if (value is String) {
                            await context.setLocale(Locale(value.toString()));
                            setState(() {});
                            await StorageRepository.putString(
                                'language', value.toString());
                            log(':::::::::: the language value is: ${value.toString()}  ::::::::::');
                            await context.setLocale(Locale(value.toString()));
                            await StorageRepository.putString(
                                'language', value.toString());
                            serviceLocator<DioSettings>()
                                .setBaseOptions(lang: value.toString());
                            await resetLocator();
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToNero1,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.language.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Text(LocaleKeys.dev_language.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                                const SizedBox(width: 12),
                                SvgPicture.asset(
                                  AppIcons.chevronRightBlack,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .darkGreyToWhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
