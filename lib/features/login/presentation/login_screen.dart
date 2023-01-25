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
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/login/presentation/pages/register_screen.dart';
import 'package:auto/features/login/presentation/pages/send_phone_number_page.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/widgets/social_media_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
  bool isToastShowing = false;

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
  void hidePopUp() {
    if (isToastShowing) {
      context.read<ShowPopUpBloc>().add(HidePopUp());
      isToastShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return KeyboardDismisser(
      child: CustomScreen(
        child: Scaffold(
          appBar: WAppBar(
            hasBackButton: false,
            title: LocaleKeys.enter.tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Text(
                  LocaleKeys.enter_to_account.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      LocaleKeys.d_y_h_account.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    WScaleAnimation(
                      onTap: () {
                        hidePopUp();
                        Navigator.push(
                            context, fade(page: const RegisterScreen()));
                      },
                      child: Text(
                        LocaleKeys.register.tr(),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 36),
                ZTextFormField(
                  onTap: hidePopUp,
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: phoneController,
                  prefixIcon: Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(AppImages.flagUzb2)),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('+998',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 15)),
                    ],
                  ),
                  hintText: '91 234 56 78',
                  hintTextStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 15, color: warmerGrey),
                  keyBoardType: TextInputType.number,
                  textInputFormatters: [phoneFormatter],
                ),
                const SizedBox(height: 30),
                ZTextFormField(
                  onTap: hidePopUp,
                  onChanged: (value) {
                    setState(() {});
                  },
                  hintText: LocaleKeys.password.tr(),
                  controller: passwordController,
                  isObscure: true,
                ),
                const SizedBox(height: 16),
                WScaleAnimation(
                  onTap: () {
                    hidePopUp();
                    Navigator.of(context)
                        .push(fade(page: const SendPhoneNumberPage()));
                  },
                  child: Text(
                    LocaleKeys.forgot_password.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 24),
                WButton(
                  isLoading: context.watch<AuthenticationBloc>().state.status ==
                      AuthenticationStatus.loading,
                  onTap: passwordController.text.length >= 4 &&
                          phoneController.text.length == 12
                      ? () {
                          hidePopUp();
                          context.read<AuthenticationBloc>().add(LoginUser(
                              onError: (text) {
                                var error = text;
                                if (error.toLowerCase().contains('dioerror')) {
                                  error =
                                      'Server bilan xatolik yuz berdi';
                                }
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message: error,
                                      isSucces: false,
                                      dismissible: false,
                                    ));
                                isToastShowing = true;
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
                  ),
                  text: LocaleKeys.continuee.tr(),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDolphin,
                  ),
                  color: (passwordController.text.length >= 4 &&
                          phoneController.text.length > 11)
                      ? orange
                      : warmerGrey,
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
                      LocaleKeys.another_ways.tr(),
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
