import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/internet_bloc/internet_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/internet_error_bottomsheet.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_divider.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/login/presentation/pages/forget_password/send_phone_number_page.dart';
import 'package:auto/features/login/presentation/pages/register/register_screen.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/widgets/social_media_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocListener<InternetBloc, InternetState>(
      bloc: context.read<InternetBloc>()..add(CheckConnectionStatus()),
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (!state.isConnected) {
            showModalBottomSheet(
              isDismissible: false,
              constraints: const BoxConstraints(
                maxHeight: 369,
                minHeight: 369,
              ),
              enableDrag: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => InternetErrorBottomSheet(
                onTap: () {
                  context
                      .read<InternetBloc>()
                      .add(GlobalCheck(isConnected: state.isConnected));
                },
              ),
            );
          } else if (state.isConnected) {
            Navigator.of(context).pop();
          }
        });
      },
      child: KeyboardDismisser(
        child: CustomScreen(
          child: Scaffold(
            backgroundColor:
                Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            appBar: WAppBar(
              hasBackButton: false,
              title: LocaleKeys.enter.tr(),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                    color: darkGray.withOpacity(0.08)),
                BoxShadow(
                    offset: const Offset(0, -1),
                    color: darkGray.withOpacity(0.08))
              ],
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
                        .displayLarge!
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.d_y_h_account.tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 4),
                      WScaleAnimation(
                        onTap: () {
                          Navigator.push(
                              context, fade(page: const RegisterScreen()));
                        },
                        child: Text(
                          LocaleKeys.register.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 36),
                  ZTextFormField(
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
                        const SizedBox(width: 8),
                        Text('+998',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    hintText: '00 000 00 00',
                    hintTextStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontSize: 14,
                            color: warmerGrey,
                            fontWeight: FontWeight.w400),
                    keyBoardType: TextInputType.number,
                    textInputFormatters: [phoneFormatter],
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  ZTextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    textInputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[\da-zA-Z!@#$&*~]')),
                    ],
                    hintText: LocaleKeys.password.tr(),
                    controller: passwordController,
                    isObscure: true,
                    hintTextStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontSize: 14,
                            color: warmerGrey,
                            fontWeight: FontWeight.w400),
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  WScaleAnimation(
                    onTap: () {
                      Navigator.of(context).push(
                        fade(
                          page: const SendPhoneNumberPage(),
                        ),
                      );
                    },
                    child: Text(
                      LocaleKeys.forgot_password.tr(),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  WButton(
                    isLoading:
                        context.watch<AuthenticationBloc>().state.status ==
                            AuthenticationStatus.loading,
                    onTap: passwordController.text.length >= 6 &&
                            phoneController.text.length == 12
                        ? () {
                            context.read<AuthenticationBloc>().add(LoginUser(
                                onError: (text) {
                                  var error = text;
                                  if (error.toLowerCase().contains('dio') ||
                                      error.toLowerCase().contains('type')) {
                                    error = LocaleKeys.service_error.tr();
                                  } else if (error
                                      .toLowerCase()
                                      .contains('user')) {
                                    error = LocaleKeys.user_already_exist.tr();
                                  }
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                        message: error,
                                        status: PopStatus.error,
                                      ));
                                },
                                password: passwordController.text,
                                userName: phoneController.text
                                    .replaceAll('+998', '')
                                    .replaceAll('', ' ')));
                          }
                        : () {},
                    margin: EdgeInsets.only(
                      bottom: 20 + MediaQuery.of(context).padding.bottom,
                    ),
                    text: LocaleKeys.continuee.tr(),
                    border: Border.all(
                        width: 1,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToEclipse),
                    color: (passwordController.text.length >= 6 &&
                            phoneController.text.length > 11)
                        ? orange
                        : Theme.of(context)
                            .extension<ThemedColors>()!
                            .ghostToEclipse,
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                      onTap: () async {
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginWithGoogle());
                      },
                      icon: SvgPicture.asset(
                          Theme.of(context).extension<ThemedIcons>()!.google),
                    ),
                    if (Platform.isIOS) ...[
                      const SizedBox(width: 24),
                      SocialMediaItem(
                        onTap: () async {
                          context
                              .read<AuthenticationBloc>()
                              .add(LoginWithAppLe());
                        },
                        icon: SvgPicture.asset(
                          AppIcons.apple,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .blackToWhite80,
                        ),
                      )
                    ],
                    const SizedBox(width: 24),
                    SocialMediaItem(
                      onTap: () async {
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginWithFaceBook());
                      },
                      icon: SvgPicture.asset(
                        AppIcons.facebook,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .dodgerBlueToWhite80,
                      ),
                    ),
                    // SocialMediaItem(
                    //   // onTap: () {},
                    //   icon: SvgPicture.asset(
                    //     AppIcons.imkon,
                    //     color: Theme.of(context)
                    //         .extension<ThemedColors>()!
                    //         .prussianBlueToWhite80,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 24 + mediaQuery.padding.bottom)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
