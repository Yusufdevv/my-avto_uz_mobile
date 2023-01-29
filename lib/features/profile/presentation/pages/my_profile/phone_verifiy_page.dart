import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
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
            appBar: WAppBar(
                onTapBack: () {
                  Navigator.pop(context);
                },
                title: LocaleKeys.tel_number.tr()),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.v(16), horizontal: SizeConfig.h(16)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeader(
                      title: LocaleKeys.confim_number.tr(),
                      description: LocaleKeys.enter_password_sms.tr(),
                    ),
                    SizedBox(height: SizeConfig.v(12)),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.h(8),
                          right: SizeConfig.h(4),
                          top: SizeConfig.v(4),
                          bottom: SizeConfig.v(4)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.h(8)),
                          color: border),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '+998 ${MyFunctions.phoneFormat(widget.phone)}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          SizedBox(width: SizeConfig.h(12)),
                          WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.h(4),
                                vertical: SizeConfig.v(4)),
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToSolitude14,
                            height: SizeConfig.v(24),
                            width: SizeConfig.v(24),
                            child: SvgPicture.asset(AppIcons.edit, color: grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.v(35)),
                    PinCodeTextField(
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
                        activeColor: isError ? red : purple,
                        activeFillColor: isError ? red : purple,
                        selectedColor: isError ? red : purple,
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 44,
                        fieldWidth: 50,
                      ),
                      cursorColor: black,
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
                    Row(
                      children: [
                        Text(LocaleKeys.send_via_password.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14)),
                        const SizedBox(width: 6),
                        if (timeComplete)
                          Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: orange.withOpacity(0.1)),
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
                                                  .contains('dioerror')) {
                                                error = LocaleKeys.service_error
                                                    .tr();
                                              }
                                              context.read<ShowPopUpBloc>().add(
                                                  ShowPopUp(
                                                      message: error,
                                                      isSucces: false));
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
                    SizedBox(height: SizeConfig.v(24)),
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
                                              isSucces: true));
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
                                      context.read<ShowPopUpBloc>().add(
                                          ShowPopUp(
                                              message: message,
                                              isSucces: false));
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
