import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/password_changing_screen.dart';
import 'package:auto/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  final ProfileBloc profileBloc;

  SettingsScreen({required this.profileBloc, Key? key}) : super(key: key);
  final edit = <List<String>>[
    [
      LocaleKeys.change_password.tr(),
      LocaleKeys.language.tr(),
    ]
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: dark.withOpacity(0.08),
                  ),
                ],
                color: white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: Row(
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    AppIcons.chevronLeft,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Настройки',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WScaleAnimation(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      fade(
                        page: PasswordChangingScreen(profileBloc: profileBloc),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
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
                const SizedBox(height: 12),
                WScaleAnimation(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width),
                        builder: (context) => const LanguageBottomSheet());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
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
                                  .headline1!
                                  .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Text(
                              'Русский',
                              style: Theme.of(context).textTheme.headline2,
                            ),
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
      );
}
