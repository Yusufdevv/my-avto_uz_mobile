import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/sms_code.dart';
import 'package:auto/features/profile/presentation/widgets/password_textfield.dart';
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
          appBar: const WAppBar(
            textWithButton: 'Смена пароля',
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                children: [
                  Text(
                    'Смена пароля',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 6),
                  Text('Придумайте новый пароль\nи постарайтесь не забыть',
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 36),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Старый пароль',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    controller: _passwordController,
                    hintText: 'Введите старый пароль',
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Новый пароль',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    controller: _password1Controller,
                    hintText: 'Введите пароль',
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Подтверждение пароля',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    controller: _password2Controller,
                    hintText: 'Введите пароль ещё раз',
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: WButton(
            margin: EdgeInsets.fromLTRB(16, 24, 16, 24+MediaQuery.of(context).viewInsets.bottom),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                fade(
                  page: const SmsCodePage(phone: '+998 88 033 18 05'),
                ),
              );
            },
            child: const Text('Далее'),
          ),
        ),
      );
}
