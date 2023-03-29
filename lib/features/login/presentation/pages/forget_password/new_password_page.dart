import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/login/domain/usecases/register_user.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/new_password/new_password_bloc.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginNewPasswordPage extends StatefulWidget {
  final String phone;
  const LoginNewPasswordPage({required this.phone, Key? key}) : super(key: key);

  @override
  State<LoginNewPasswordPage> createState() => _LoginNewPasswordPageState();
}

class _LoginNewPasswordPageState extends State<LoginNewPasswordPage> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late NewPasswordBloc newPasswordBloc;

  @override
  void initState() {
    newPasswordBloc = NewPasswordBloc(
        changePassword: ChangePasswordInLoginUseCase(), phone: widget.phone);
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: KeyboardDismisser(
          child: BlocProvider.value(
            value: newPasswordBloc,
            child: BlocConsumer<NewPasswordBloc, NewPasswordState>(
              listener: (context, state) {
                if (state.status == FormzStatus.submissionCanceled) {
                  var error = state.toastMessage;
                  if (error.toLowerCase().contains('dio') ||
                      error.toLowerCase().contains('type')) {
                    error = LocaleKeys.service_error.tr();
                  }
                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                        message: error,
                        status: PopStatus.error,
                      ));
                }
                if (state.status == FormzStatus.submissionSuccess) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      fade(
                        page: BlocProvider(
                          create: (c) => RegisterBloc(
                            sendCodeUseCase: SendCodeUseCase(),
                            registerUseCase: RegisterUseCase(),
                            verifyCodeUseCase: VerifyCodeUseCase(),
                          ),
                          child: const LoginScreen(),
                        ),
                      ),
                      (route) => false);
                }
              },
              builder: (context, state) => CustomScreen(
                child: Scaffold(
                  backgroundColor: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
                  appBar: WAppBar(
                    title: LocaleKeys.forgot_password.tr(),
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
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginHeader(
                          title: LocaleKeys.new_password.tr(),
                          description:
                              LocaleKeys.create_password_a_no_forget.tr(),
                        ),
                        const SizedBox(height: 36),
                        ZTextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          textInputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[\da-zA-Z!@#$&*~]')),
                          ],
                          isObscure: true,
                          hintText: LocaleKeys.new_password.tr(),
                          controller: newPasswordController,
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
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 16),
                        ZTextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          textInputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9a-zA-Z]')),
                          ],
                          isObscure: true,
                          hintText: LocaleKeys.confirm_password.tr(),
                          controller: confirmPasswordController,
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
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 36),
                        WButton(
                          isLoading:
                              state.status == FormzStatus.submissionInProgress,
                          onTap: () {
                            if (newPasswordController.text.length >= 6 &&
                                confirmPasswordController.text.length >= 6) {
                              if (newPasswordController.text ==
                                  confirmPasswordController.text) {
                                newPasswordBloc.add(
                                  NewPasswordEvent(
                                      password: newPasswordController.text),
                                );
                              } else {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message:
                                          LocaleKeys.passwords_didnt_match.tr(),
                                      status: PopStatus.error,
                                    ));
                              }
                            } else {
                              context.read<ShowPopUpBloc>().add(
                                    ShowPopUp(
                                        message:
                                            LocaleKeys.password_must_6.tr(),
                                        status: PopStatus.error),
                                  );
                            }
                          },
                          margin: EdgeInsets.only(
                              bottom:
                                  4 + MediaQuery.of(context).padding.bottom),
                          color: (newPasswordController.text.length < 6 &&
                                  confirmPasswordController.text.length < 6)
                              ? Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .veryLightGreyToEclipse
                              : orange,
                          text: LocaleKeys.continuee.tr(),
                          border: Border.all(width: 1, color: white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
