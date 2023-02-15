import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/send_recovery_code.dart';
import 'package:auto/features/login/presentation/bloc/send_phone/send_phone_bloc.dart';
import 'package:auto/features/login/presentation/pages/forget_password/verify_sms_code_page.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SendPhoneNumberPage extends StatefulWidget {
  const SendPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<SendPhoneNumberPage> createState() => _SendPhoneNumberPageState();
}

class _SendPhoneNumberPageState extends State<SendPhoneNumberPage> {
  late TextEditingController phoneController;
  late SendPhoneBloc sendPhoneBloc;
  bool isToastShowing = false;
  @override
  void initState() {
    phoneController = TextEditingController();
    sendPhoneBloc = SendPhoneBloc(senCode: SendRecoveryCodeUseCase());
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    // ignore: prefer_single_quotes
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          context.read<ShowPopUpBloc>().add(HidePopUp());
          return true;
        },
        child: CustomScreen(
          child: KeyboardDismisser(
            child: BlocProvider.value(
              value: sendPhoneBloc,
              child: BlocConsumer<SendPhoneBloc, SendPhoneState>(
                listener: (context, state) {
                  if (state.status == FormzStatus.submissionCanceled) {
                    var error = state.toastMessage;
                    if (error.toLowerCase().contains('dio') ||
                        error.toLowerCase().contains('type')) {
                      error = LocaleKeys.service_error.tr();
                    }
                    context.read<ShowPopUpBloc>().add(
                          ShowPopUp(
                            message: error,
                            status: PopStatus.error,
                            dismissible: false,
                          ),
                        );
                    isToastShowing = true;
                  }
                  if (state.status == FormzStatus.submissionSuccess) {
                    Navigator.push(
                      context,
                      fade(
                        page: BlocProvider.value(
                          value: sendPhoneBloc,
                          child: VerifySmsCodePage(
                            phone: phoneController.text,
                            session: state.session,
                          ),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) => Scaffold(
                  backgroundColor: white,
                  appBar: WAppBar(
                    backgroundColor: white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 16,
                          color: darkGray.withOpacity(0.08)),
                      BoxShadow(
                          offset: const Offset(0, -1),
                          color: darkGray.withOpacity(0.08))
                    ],
                    title: LocaleKeys.forgot_password.tr(),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 64),
                        Text(
                          LocaleKeys.recovery_password.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          LocaleKeys.check_number.tr(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 36),
                        ZTextFormField(
                          onTap: () {
                            if (isToastShowing) {
                              context.read<ShowPopUpBloc>().add(HidePopUp());
                              isToastShowing = false;
                            }
                          },
                          onChanged: (onChanged) {
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
                              Text(
                                '+998',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          hintTextStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14,
                                  color: warmerGrey,
                                  fontWeight: FontWeight.w400),
                          hintText: '00 000 00 00',
                          keyBoardType: TextInputType.number,
                          textInputFormatters: [phoneFormatter],
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
                          disabledColor: disabledButton,
                          isDisabled: phoneController.text.length != 12,
                          text: LocaleKeys.continuee.tr(),
                          onTap: () => sendPhoneBloc
                              .add(SendPhoneEvent(phone: phoneController.text)),
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
