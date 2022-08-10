import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/new_password.dart';
import 'package:auto/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChangeScreen extends StatelessWidget {
  PasswordChangeScreen({Key? key}) : super(key: key);
  final edit = <List<String>>[
    ['Смена пароля', 'Язык']
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          textWithButton: 'Настройки',
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WScaleAnimation(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    fade(
                      page: NewPasswordsPage(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                            'Смена пароля',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w600),
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
                      isScrollControlled: true,
                      context: context,
                      useRootNavigator: true,
                      backgroundColor: Colors.transparent,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width),
                      builder: (context) => const LanguageBottomSheet());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                            'Язык',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w600),
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
