import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/domain/usecases/verify_recovery.dart';
import 'package:auto/features/login/presentation/bloc/send_phone/send_phone_bloc.dart';
import 'package:auto/features/login/presentation/bloc/verify/verify_bloc.dart';
import 'package:auto/features/login/presentation/pages/forget_password/new_password_page.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
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

  bool isError = false;

  @override
  Widget build(BuildContext context) => CustomScreen(
    child: KeyboardDismisser(
      child: BlocProvider.value(
        value: verifyBloc,
        child: BlocConsumer<VerifyBloc, VerifyState>(
          listener: (context, state) {
            if (state.status == FormzStatus.submissionCanceled) {
              isError = true;
              var error = state.toastMessage;
              if (error.toLowerCase().contains('dio') ||
                  error.toLowerCase().contains('type')) {
                error = LocaleKeys.service_error.tr();
              }
              context.read<ShowPopUpBloc>().add(
                    ShowPopUp(
                      message: error,
                      status: PopStatus.error,
                    ),
                  );
            }
            if (state.status == FormzStatus.submissionSuccess) {
              Navigator.pushReplacement(
                context,
                fade(
                  page: BlocProvider.value(
                      value: verifyBloc,
                      child: LoginNewPasswordPage(phone: state.phone)),
                ),
              );
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: white,
            resizeToAvoidBottomInset: false,
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
                    padding: const EdgeInsets.only(
                        left: 8, right: 4, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: border),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '+998 ${widget.phone}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                        ),
                        const SizedBox(width: 12),
                        WButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderRadius: 4,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .solitudeToSolitude14,
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(AppIcons.edit,
                              color: grey),
                        )
                      ],
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
                        borderWidth: 1),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[\da-zA-Z!@#$&*~]')),
                    ],
                    cursorColor: black,
                    cursorWidth: 1,
                    cursorHeight: 31,
                    keyboardType: TextInputType.number,
                    enableActiveFill: false,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                            fontSize: 24, fontWeight: FontWeight.w400),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 4),
                    appContext: context,
                    showCursor: true,
                  ),
                  Row(
                    children: [
                      Text(LocaleKeys.send_via_password.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
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
                                context.read<SendPhoneBloc>().add(
                                    SendPhoneEvent(phone: widget.phone));
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
                          child: Center(
                            child: TimeCounter(
                              onComplete: () {
                                setState(() {
                                  timeComplete = true;
                                });
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: WButton(
                      isLoading: state.status ==
                          FormzStatus.submissionInProgress,
                      onTap: () {
                        verifyBloc.add(
                          VerifyVerifyEvent(
                            param: VerifyParam(
                                phone: widget.phone,
                                code: passwordRecoveryController.text,
                                session: context
                                    .read<SendPhoneBloc>()
                                    .state
                                    .session),
                          ),
                        );
                      },
                      margin: EdgeInsets.only(
                          bottom:
                              4 + MediaQuery.of(context).padding.bottom),
                      isDisabled:
                          passwordRecoveryController.text.length < 6,
                      disabledColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .veryLightGreyToEclipse,
                      text: LocaleKeys.continuee.tr(),
                      border: Border.all(
                        width: 1,
                        color: white,
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
