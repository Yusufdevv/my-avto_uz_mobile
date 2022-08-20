import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/pages/password_recovery_screen.dart';
import 'package:auto/features/login/presentation/pages/register_screen.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              AppIcons.chevronLeft,
              height: 24,
              width: 24,
            ),
          ),
          title: Text(
            'Войти',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
          ),
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              Text(
                'Войти в существуюущий аккаунт',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    'У вас нету аккаунта?',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context, fade(page: const RegisterScreen())),
                    child: Text(
                      'Регистрация',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              ZTextFormField(
                onChanged: (onChanged) {
                  setState(() {});
                },
                controller: phoneController,
                prefixIcon: Row(
                  children: [
                    Image.asset(AppImages.flagUzb),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '+998',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
                hintText: '91 234 56 78',
                keyBoardType: TextInputType.number,
                textInputFormatters: [phoneFormatter],
              ),
              const SizedBox(
                height: 30,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                hintText: 'Пароль',
                controller: passwordController,
                isObscure: true,
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    fade(
                        page: const PasswordRecoveryScreen(
                      phone: '+998 97 777 77 77',
                    ))),
                child: Text(
                  'Забыли пароль?',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          onTap: () => phoneController.text.isEmpty ||
                  passwordController.text.isEmpty
              ? () {}
              : Navigator.pushAndRemoveUntil(
                  context, fade(page: const HomeScreen()), (route) => false),
          shadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .transparentToSolitude12)
          ],
          margin: EdgeInsets.only(
            bottom: 8 + MediaQuery.of(context).padding.bottom,
            right: 16,
            left: 16,
          ),
          color: (passwordController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty)
              ? orange
              : Theme.of(context)
                  .extension<ThemedColors>()!
                  .veryLightGreyToEclipse,
          text: 'Продолжить',
          border: Border.all(
            width: 1,
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDolphin,
          ),
        ),
      );
}
