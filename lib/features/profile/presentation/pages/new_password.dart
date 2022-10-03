import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/sms_code.dart';
import 'package:auto/features/profile/presentation/widgets/password_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class NewPasswordsPage extends StatelessWidget {
  NewPasswordsPage({Key? key}) : super(key: key);

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: WAppBar(
            textWithButton: LocaleKeys.change_password.tr(),
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.change_password.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 6),
                  Text(LocaleKeys.create_unfoget.tr(),
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 36),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.old_password.tr(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    controller: _passwordController,
                    hintText: LocaleKeys.write_old_password.tr(),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.new_password.tr(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    controller: _password1Controller,
                    hintText: LocaleKeys.enter_Passowrd.tr(),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.confirm_password.tr(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    controller: _password2Controller,
                    hintText: LocaleKeys.write_again.tr(),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: WButton(
            margin: EdgeInsets.fromLTRB(
                16, 24, 16, 24 + MediaQuery.of(context).viewInsets.bottom),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                fade(
                  page: const SmsCodePage(phone: '+998 88 033 18 05'),
                ),
              );
            },
            child: Text(
              LocaleKeys.further.tr(),
            ),
          ),
        ),
      );
}
