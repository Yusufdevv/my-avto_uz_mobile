import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/login/domain/usecases/send_recovery_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/domain/usecases/verify_recovery.dart';
import 'package:auto/features/login/presentation/bloc/recovery/recovery_bloc.dart';
import 'package:auto/features/login/presentation/pages/new_password_screen.dart';
import 'package:auto/features/login/presentation/widgets/SignIn_with_socials.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/refresh_button.dart';
import 'package:auto/features/profile/presentation/widgets/time_counter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  final String phone;
  final String session;

  const PasswordRecoveryScreen(
      {required this.phone, required this.session, Key? key})
      : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  late TextEditingController passwordRecoveryController;
  bool timeComplete = false;
  late RecoveryBloc recoveryBloc;
  String sessions = '';

  @override
  void initState() {
    recoveryBloc = RecoveryBloc(SendRecoveryCodeUseCase(),
        VerifyRecoveryUseCase(), ChangePasswordInLoginUseCase())
      ..add(RecoveryEvent.sendCode(widget.phone, onSuccess: (session) {
        sessions = session;
      }));
    passwordRecoveryController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    passwordRecoveryController.dispose();
    super.dispose();
  }

  /// comment to
  bool isError = false;
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          backgroundColor: white,
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
                  title: LocaleKeys.recovery_password.tr(),
                  description: LocaleKeys.enter_password_sms.tr(),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitudeToBastille),
                  child: Text(
                    '+998 ${widget.phone.replaceAll(' ', '')}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 35),
                PinCodeTextField(
                  onChanged: (value) {
                    setState(() {
                      isError = false;
                    });
                  },
                  controller: passwordRecoveryController,
                  length: 6,
                  pinTheme: PinTheme(
                    inactiveColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToWhite35,
                    errorBorderColor: red,
                    activeColor: isError ? red : purple,
                    activeFillColor: isError ? red : purple,
                    selectedColor: isError ? red : purple,
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 44,
                    fieldWidth: 50,
                    borderWidth: 1,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[\da-zA-Z!@#$&*~]')),
                  ],
                  cursorColor: Theme.of(context).extension<ThemedColors>()!.darkToWhite,
                  cursorWidth: 1,
                  cursorHeight: 31,
                  keyboardType: TextInputType.number,
                  enableActiveFill: false,
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 4),
                  appContext: context,
                  showCursor: true,
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Text(LocaleKeys.send_via_password.tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    const SizedBox(width: 6),
                    if (timeComplete)
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: solitude),
                        child: Center(
                          child: RefreshButton(
                            filteredPhone: widget.phone,
                            onSucces: () {
                              setState(() {
                                timeComplete = false;
                              });
                            },
                          ),
                        ),
                      )
                    else
                      Container(
                        height: 21,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: orange.withOpacity(0.1)),
                        child: TimeCounter(
                          onComplete: () {
                            setState(() {
                              timeComplete = true;
                            });
                          },
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: WButton(
                    onTap: () {
                      recoveryBloc.add(
                        RecoveryEvent.verifyCode(
                          VerifyParam(
                              phone: widget.phone,
                              code: passwordRecoveryController.text,
                              session: sessions),
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              fade(
                                page: BlocProvider.value(
                                  value: recoveryBloc,
                                  child: NewPasswordScreen(
                                    onSubmit: (password, confirmPassword) {
                                      recoveryBloc.add(
                                        RecoveryEvent.changePassword(
                                          password: password,
                                          onSuccess: () {
                                            context
                                                .read<AuthenticationBloc>()
                                                .add(AuthenticationStatusChanged(
                                                    status: AuthenticationStatus
                                                        .authenticated));
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    margin: EdgeInsets.only(
                        bottom: 4 + MediaQuery.of(context).padding.bottom),
                    color: (passwordRecoveryController.text.isNotEmpty)
                        ? orange
                        : Theme.of(context).extension<ThemedColors>()!.ghostToEclipse,
                    border: Border.all(width: 1, color: Theme.of(context).extension<ThemedColors>()!.whiteToEclipse),
                    text: LocaleKeys.continuee.tr(),
                  ),
                ),
                const Spacer(),
                const SignInWithSocials(),
                const SizedBox(height: 42)
              ],
            ),
          ),
        ),
      );
}
