import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/pages/personal_data/personal_data_screen.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/refresh_button.dart';
import 'package:auto/features/profile/presentation/widgets/time_counter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterVerificationScreen extends StatefulWidget {
  final String phone;
  final String session;

  const RegisterVerificationScreen(
      {required this.phone, required this.session, Key? key})
      : super(key: key);

  @override
  State<RegisterVerificationScreen> createState() =>
      _RegisterVerificationScreenState();
}

class _RegisterVerificationScreenState
    extends State<RegisterVerificationScreen> {
  late TextEditingController verificationController;
  bool timeComplete = false;
  bool isToastShowing = false;
  late String session;
  @override
  void initState() {
    verificationController = TextEditingController();
    session = widget.session;

    super.initState();
  }

  bool isError = false;

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: CustomScreen(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) => Scaffold(
              backgroundColor: white,
              appBar: WAppBar(
                title: LocaleKeys.register.tr(),
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
                      title: LocaleKeys.confim_number.tr(),
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
                                .headline6!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 14),
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
                            child: SvgPicture.asset(AppIcons.edit, color: grey),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    PinCodeTextField(
                      onTap: () {
                        if (isToastShowing) {
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                          isToastShowing = false;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          isError = false;
                        });
                      },
                      controller: verificationController,
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
                      cursorColor: black,
                      cursorWidth: 1,
                      cursorHeight: 31,
                      keyboardType: TextInputType.number,
                      enableActiveFill: false,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 4),
                      appContext: context,
                      showCursor: true,
                    ),
                    Row(
                      children: [
                        Text(LocaleKeys.send_via_password.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
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
                                  context.read<RegisterBloc>().add(
                                          RegisterEvent.sendCode(widget.phone,
                                              onError: (text) {
                                        if (text.isNotEmpty) {
                                          var error = text;
                                          if (error
                                              .toLowerCase()
                                              .contains('dioerror')) {
                                            error =
                                                LocaleKeys.service_error.tr();
                                          }
                                          context.read<ShowPopUpBloc>().add(
                                              ShowPopUp(
                                                  message: error,
                                                 status: PopStatus.error,
                                                  dismissible: false));
                                        } else {
                                          context.read<ShowPopUpBloc>().add(
                                              ShowPopUp(
                                                  message: LocaleKeys
                                                      .service_error
                                                      .tr(),
                                                  status: PopStatus.error,
                                                  dismissible: false));
                                        }
                                        isToastShowing = true;
                                      }, onSuccess: (sessionn) {
                                        session = sessionn;
                                      }));
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
                    const SizedBox(height: 24),
                    WButton(
                      isLoading: state.verifyStatus ==
                          FormzStatus.submissionInProgress,
                      onTap: () => verificationController.text.isNotEmpty &&
                              verificationController.text.length == 6
                          ? context
                              .read<RegisterBloc>()
                              .add(RegisterEvent.registerVerifyCode(
                                  VerifyParam(
                                    code: verificationController.text,
                                    phone: widget.phone,
                                    session: session,
                                  ), onError: (text) {
                                isError = true;
                                setState(() {});

                                context.read<ShowPopUpBloc>().add(
                                      ShowPopUp(
                                        message: text,
                                         status: PopStatus.error,
                                        dismissible: false,
                                      ),
                                    );
                                isToastShowing = true;
                              }, onSuccess: () {
                                Navigator.pushReplacement(
                                    context,
                                    fade(
                                        page: BlocProvider.value(
                                            value: context.read<RegisterBloc>(),
                                            child:
                                                const PersonalDataScreen())));
                              }))
                          : {},
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 4),
                      color: (verificationController.text.isNotEmpty &&
                              verificationController.text.length == 6)
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
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
