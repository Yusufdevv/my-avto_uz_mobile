import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/pages/password_recovery_screen.dart';
import 'package:auto/features/login/presentation/widgets/SignIn_with_socials.dart';
// import 'package:auto/features/login/presentation/widgets/signIn_with_socials.dart';
// import 'package:auto/features/login/presentation/widgets/SignIn_with_socials.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  State<LoginScreen1> createState() => _LoginScreenState1();
}

class _LoginScreenState1 extends State<LoginScreen1> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp('[0-9]')},
  );
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   phoneController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
      child: Scaffold(
          appBar: const WAppBar(
            hasBackButton: true,
            title: 'Забыли пароль',
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 64),
                    Text(
                      'Восстановление пароля',
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
                          'Мы проверим ваш номер телефона в системе',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                        ),
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
                      hintText: '00 000 00 00',
                      keyBoardType: TextInputType.number,
                      textInputFormatters: [phoneFormatter],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: WButton(
                        onTap: phoneController.text.length == 12
                            ? () => Navigator.push(
                                  context,
                                  fade(
                                    page: PasswordRecoveryScreen(
                                      phone: phoneController.text,
                                      session: '',
                                    ),
                                  ),
                                )
                            : () {},
                        shadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: solitude.withOpacity(.12)),
                        ],
                        margin: EdgeInsets.only(
                          bottom: 20 + MediaQuery.of(context).padding.bottom,
                          right: 16,
                          left: 16,
                        ),
                        color: (phoneController.text.length == 12)
                            ? orange
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .veryLightGreyToEclipse,
                        text: 'Продолжить',
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToDolphin,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const SignInWithSocials(),
                    const SizedBox(height: 58)
                  ]))));
}
