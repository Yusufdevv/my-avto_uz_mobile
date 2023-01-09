import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/domain/usecases/verify_recovery.dart';
import 'package:auto/features/login/presentation/bloc/verify/verify_bloc.dart';
import 'package:auto/features/login/presentation/pages/login_new_password_page.dart';
import 'package:auto/features/login/presentation/widgets/SignIn_with_socials.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/refresh_button.dart';
import 'package:auto/features/profile/presentation/widgets/time_counter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifySmsCodePage extends StatefulWidget {
  final String phone;
  final String session;

  const VerifySmsCodePage(
      {required this.phone, required this.session, Key? key})
      : super(key: key);

  @override
  State<VerifySmsCodePage> createState() => _VerifySmsCodePageState();
}

class _VerifySmsCodePageState extends State<VerifySmsCodePage> {
  late TextEditingController passwordRecoveryController;
  bool timeComplete = false;
  late VerifyBloc verifyBloc;

  @override
  void initState() {
    verifyBloc = VerifyBloc(
      phone: widget.phone,
      verifyCode: VerifyRecoveryUseCase(),
      changePassword: ChangePasswordInLoginUseCase(),
    );
    passwordRecoveryController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    passwordRecoveryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomScreen(
      child: KeyboardDismisser(
        child: BlocProvider.value(
          value: verifyBloc,
          child: BlocConsumer<VerifyBloc, VerifyState>(
            listener: (context, state) {
              if (state.status == FormzStatus.submissionCanceled) {
                context.read<ShowPopUpBloc>().add(
                    ShowPopUp(message: state.toastMessage, isSucces: false));
              }
              if (state.status == FormzStatus.submissionSuccess) {
                Navigator.pushReplacement(
                  context,
                  fade(
                    page: BlocProvider.value(
                      value: verifyBloc,
                      child: LoginNewPasswordPage(
                        phone: state.phone,
                      ),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) => Scaffold(
              appBar: const WAppBar(
                title: 'Забыли пароль',
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
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .solitudeToBastille,
                      ),
                      child: Text(
                        '+998 ${widget.phone.replaceAll(' ', '')}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    PinCodeTextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: passwordRecoveryController,
                      length: 6,
                      pinTheme: PinTheme(
                        inactiveColor: Theme.of(context)
                            .extension<ThemedColors>()!
                            .solitudeToWhite35,
                        errorBorderColor: red,
                        activeColor: purple,
                        activeFillColor: purple,
                        selectedColor: purple,
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 44,
                        fieldWidth: 50,
                      ),
                      cursorColor: white,
                      keyboardType: TextInputType.number,
                      enableActiveFill: false,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 18),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 4),
                      appContext: context,
                      showCursor: true,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text(LocaleKeys.send_via_password.tr(),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 14,
                                    )),
                        const SizedBox(
                          width: 6,
                        ),
                        if (timeComplete)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: orange.withOpacity(0.1)),
                            child: RefreshButton(
                              filteredPhone: widget.phone,
                              onSucces: () {
                                setState(() {
                                  timeComplete = false;
                                });
                              },
                            ),
                          )
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 3),
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
                          )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: WButton(
                        isLoading: state.status == FormzStatus.submissionInProgress,
                        onTap: () {
                          verifyBloc.add(
                            VerifyVerifyEvent(
                              param: VerifyParam(
                                phone: widget.phone,
                                code: passwordRecoveryController.text,
                                session: widget.session,
                              ),
                            ),
                          );
                        },
                        shadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: solitude.withOpacity(.12)),
                        ],
                        margin: EdgeInsets.only(
                            bottom: 4 + MediaQuery.of(context).padding.bottom),
                        color: (passwordRecoveryController.text.isNotEmpty)
                            ? orange
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .veryLightGreyToEclipse,
                        text: LocaleKeys.continuee.tr(),
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
                    const SizedBox(height: 42)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
}