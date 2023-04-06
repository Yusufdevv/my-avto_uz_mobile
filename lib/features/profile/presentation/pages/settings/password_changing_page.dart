import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/settings/new_password_page.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordChangingPage extends StatelessWidget {
  const PasswordChangingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: Scaffold(
          backgroundColor:
              Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
          appBar: WAppBar(
            textWithButton: LocaleKeys.settings.tr(),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 36, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.change_password.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(height: 4),
                Text(
                  LocaleKeys.to_change_your_password.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: LightThemeColors.displayMedium),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 64, minHeight: 36, minWidth: double.maxFinite),
                  child: const SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.664,
                        width: MediaQuery.of(context).size.width * 0.664,
                        child: Image.asset(
                          StorageRepository.getString(StorageKeys.THEME_MODE) ==
                                  'light'
                              ? AppImages.editPassword
                              : AppImages.editPasswordDark,
                          height: MediaQuery.of(context).size.width * 0.664,
                          width: MediaQuery.of(context).size.width * 0.664,
                        )),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: WButton(
            shadow: [
              BoxShadow(
                blurRadius: 20,
                offset: const Offset(0, 4),
                color: orange.withOpacity(0.2),
              ),
            ],
            margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .push(fade(page: const NewPasswordsPage()));
            },
            child: Text(
              LocaleKeys.change_password.tr(),
            ),
          ),
        ),
      );
}
