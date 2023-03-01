import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
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
          backgroundColor: white,
          appBar: WAppBar(
            textWithButton: LocaleKeys.settings.tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
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
                  LocaleKeys.need_code_from_sms.tr(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 64),
                    alignment: Alignment.center,
                    height: 249,
                    child: Image.asset(AppImages.editPassword)),
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
