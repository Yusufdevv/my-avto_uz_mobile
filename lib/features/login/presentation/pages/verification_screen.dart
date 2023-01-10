import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/pages/personal_data_screen.dart';
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

class VerificationScreen extends StatefulWidget {
  final String phone;
  final String session;

  const VerificationScreen(
      {required this.phone, required this.session, Key? key})
      : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController verificationController;
  bool timeComplete = false;
  bool isToastShowing = false;

  @override
  void initState() {
    verificationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // verificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: CustomScreen(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) => Scaffold(
              appBar: const WAppBar(
                title: 'Регистрация',
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
                          const SizedBox(
                            width: 12,
                          ),
                          WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            padding: const EdgeInsets.all(4),
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToSolitude14,
                            height: 24,
                            child: SvgPicture.asset(AppIcons.edit),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    PinCodeTextField(
                      onTap: () {
                        if (isToastShowing) {
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                          isToastShowing = false;
                        }
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: verificationController,
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
                        Text(LocaleKeys.send_password_again.tr(),
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
                    const SizedBox(height: 24),
                    //  const Spacer(),
                    WButton(
                      isLoading: state.verifyStatus ==
                          FormzStatus.submissionInProgress,
                      onTap: () => verificationController.text.isNotEmpty &&
                              verificationController.text.length == 6
                          ? context.read<RegisterBloc>().add(
                                  RegisterEvent.registerVerifyCode(
                                      VerifyParam(
                                          code: verificationController.text,
                                          phone: widget.phone,
                                          session: widget.session),
                                      onError: (text) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: text,
                                    isSucces: false,
                                    dismissible: false));
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
                      shadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                            color: solitude.withOpacity(.12)),
                      ],
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
