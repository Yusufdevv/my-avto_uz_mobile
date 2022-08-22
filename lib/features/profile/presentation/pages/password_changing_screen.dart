import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/new_password.dart';
import 'package:auto/features/profile/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';

class PasswordChangingScreen extends StatelessWidget {
  const PasswordChangingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          textWithButton: 'Настройки',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Смена пароля',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 24),
              ),
              const SizedBox(height: 4),
              Text(
                'Чтобы сменить пароль, потребуется ввести текущий пароль или код из SMS',
                style: Theme.of(context).textTheme.headline2,
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
          margin:  EdgeInsets.fromLTRB(16, 20, 16, 15+MediaQuery.of(context).padding.bottom),
          onTap: () {
            Navigator.of(context).push(
              fade(
                page: NewPasswordsPage(),
              ),
            );
          },
          //
          child: const Text('Сменить пароль'),
        ),
      );
}

//
