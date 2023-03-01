import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/profile/presentation/bloc/change_phone_number/change_phone_number_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerifiyPage extends StatefulWidget {
  final String phone;
  final BuildContext ctx;

  const PhoneVerifiyPage({required this.phone, required this.ctx, Key? key})
      : super(key: key);

  @override
  State<PhoneVerifiyPage> createState() => _PhoneVerifiyPageState();
}

class _PhoneVerifiyPageState extends State<PhoneVerifiyPage> {
  late TextEditingController verificationController;
  bool timeComplete = false;
  bool isError = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    verificationController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: CustomScreen(
          child: Scaffold(
            backgroundColor: white,
            appBar:
                WAppBar(hasBackButton: true, title: LocaleKeys.tel_number.tr()),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical:16, horizontal: 16),
              child: Form(
                key: _formKey,
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
                          left: 8,
                          right: 4,
                          top: 4,
                          bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: border),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '+998 ${MyFunctions.phoneFormat(widget.phone)}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          const SizedBox(width: 12),
                          WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            padding: const EdgeInsets.all(4),
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
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[\da-zA-Z!@#$&*~]')),
                      ],
                      cursorColor: black,
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
                    Row(
                      children: [
                        Text(LocaleKeys.send_via_password.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
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
                                    context.read<ChangePhoneNumberBloc>().add(
                                          SendPhoneNumberEvent(
                                            newPhoneNumber:
                                                '+998${widget.phone}',
                                            onSuccess: () {},
                                            onError: (message) {
                                              var error = message;
                                              if (error
                                                      .toLowerCase()
                                                      .contains('dio') ||
                                                  error
                                                      .toLowerCase()
                                                      .contains('type')) {
                                                error = LocaleKeys.service_error
                                                    .tr();
                                              }
                                              context
                                                  .read<ShowPopUpBloc>()
                                                  .add(ShowPopUp(
                                                    message: error,
                                                    status: PopStatus.error,
                                                  ));
                                              setState(() {
                                                isError = true;
                                              });
                                            },
                                          ),
                                        );
                                  },
                                ),
                              ))
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
                    const Spacer(),
                    BlocBuilder<ChangePhoneNumberBloc, ChangePhoneNumberState>(
                      builder: (context, state) => WButton(
                        isLoading:
                            state.status == FormzStatus.submissionInProgress,
                        onTap: () {
                          if (verificationController.text.length == 6) {
                            context
                                .read<ChangePhoneNumberBloc>()
                                .add(VerifyCodeEvent(
                                    newPhoneNumber: '+998${widget.phone}',
                                    code: verificationController.text,
                                    onSuccess: () {
                                      context.read<ShowPopUpBloc>().add(
                                          ShowPopUp(
                                              message: LocaleKeys
                                                  .phone_number_changed_success
                                                  .tr(),
                                              status: PopStatus.success));
                                      context
                                          .read<ProfileBloc>()
                                          .add(GetProfileEvent());
                                      Navigator.pop(context);
                                      Navigator.pop(widget.ctx);
                                    },
                                    onError: (message) {
                                      setState(() {
                                        isError = true;
                                      });
                                      context
                                          .read<ShowPopUpBloc>()
                                          .add(ShowPopUp(
                                            message: message,
                                            status: PopStatus.error,
                                          ));
                                    }));
                          }
                        },
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
                          color: white,
                        ),
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
