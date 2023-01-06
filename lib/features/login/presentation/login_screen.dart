import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_divider.dart';
import 'package:auto/features/login/presentation/pages/password_recovery_screen.dart';
import 'package:auto/features/login/presentation/pages/register_screen.dart';
import 'package:auto/features/login/presentation/pages/reset_password.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/widgets/social_media_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp('[0-9]')},
  );
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneController = TextEditingController(text: '94 678 60 12');
    passwordController = TextEditingController(text: 'rW2gA6eN4hB9rQ1m');
    super.initState();
  }

  // @override
  // void dispose() {
  //   phoneController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return KeyboardDismisser(
      child: CustomScreen(
        child: Scaffold(
          appBar: const WAppBar(
            hasBackButton: false,
            title: 'Войти',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Text(
                  'Войти в существуюущий аккаунт',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 4),
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
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 36),
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
                const SizedBox(height: 30),
                ZTextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  hintText: 'Пароль',
                  controller: passwordController,
                  isObscure: true,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(fade(page: const ForgotPasswordSendPhonePage()));
                  },
                  child: Text(
                    'Забыли пароль?',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 24),
                WButton(
                  isDisabled: !(passwordController.text.length >= 4 &&
                      phoneController.text.length == 12),
                  onTap: passwordController.text.length >= 4 &&
                          phoneController.text.length == 12
                      ? () {
                          context.read<AuthenticationBloc>().add(LoginUser(
                              onError: (text) {
                                if (text.isNotEmpty) {
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message: text, isSucces: false));
                                } else {}
                              },
                              password: passwordController.text,
                              userName: phoneController.text
                                  .replaceAll('+998', '')
                                  .replaceAll('', ' ')));
                        }
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
                  text: 'Продолжить',
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDolphin,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      child: WDivider(
                    margin: EdgeInsets.only(left: 32),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Другие способы входа',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                    ),
                  ),
                  const Expanded(
                      child: WDivider(
                    margin: EdgeInsets.only(right: 32),
                  )),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaItem(
                    // onTap: () {},
                    icon: SvgPicture.asset(
                        Theme.of(context).extension<ThemedIcons>()!.google),
                  ),
                  const SizedBox(width: 24),
                  SocialMediaItem(
                      // onTap: () {},
                      icon: SvgPicture.asset(
                    AppIcons.apple,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .blackToWhite80,
                  )),
                  const SizedBox(width: 24),
                  SocialMediaItem(
                    // onTap: () {},
                    icon: SvgPicture.asset(
                      AppIcons.imkon,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .prussianBlueToWhite80,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24 + mediaQuery.padding.bottom)
            ],
          ),
        ),
      ),
    );
  }
}
