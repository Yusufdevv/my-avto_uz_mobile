import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/password_change_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          textWithButton: 'Настройки',
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 36, left: 16),
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
                  margin: const EdgeInsets.all(63),
                  child: Image.asset(AppImages.editPassword)),
              
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          onTap: () {
            Navigator.of(context).push(
              fade(
                page: PasswordChangeScreen(),
              ),
            );
          },
          //
          child: const Text('Сменить пароль'),
        ),
      );
}

//
