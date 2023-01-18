import 'dart:async';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/settings/password_changing_page.dart';
import 'package:auto/features/profile/presentation/profile_screen.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  final ProfileBloc profileBloc;

  const SettingsPage({required this.profileBloc, Key? key}) : super(key: key);

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
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.v(16), horizontal: SizeConfig.h(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WScaleAnimation(
                      onTap: () {
                        Navigator.of(context).push(
                          fade(
                            page: PasswordChangingPage(
                                profileBloc: widget.profileBloc),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.h(12),
                            vertical: SizeConfig.v(16)),
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
                                  LocaleKeys.change_password.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(12)),
                    WScaleAnimation(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width),
                            builder: (context) =>
                                const LanguageBottomSheet()).then((value) {
                          if (value is String) {
                            context.setLocale(Locale(value.toString()));
                            setState(() {});
                            serviceLocator<DioSettings>()
                                .setBaseOptions(lang: value.toString());
                            StorageRepository.putString(
                                'language', value.toString());
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.h(12),
                            vertical: SizeConfig.v(16)),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToNero1,
                          borderRadius: BorderRadius.circular(SizeConfig.h(12)),
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
                                      .headline1!
                                      .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Text(LocaleKeys.dev_language.tr(),
                                    style:
                                        Theme.of(context).textTheme.headline2),
                                SizedBox(width: SizeConfig.h(12)),
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
