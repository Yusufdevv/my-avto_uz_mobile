import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/send_recovery_code.dart';
import 'package:auto/features/login/presentation/bloc/send_phone/send_phone_bloc.dart';
import 'package:auto/features/login/presentation/pages/verify_sms_code_page.dart';
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
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: KeyboardDismisser(
          child: BlocProvider.value(
            value: sendPhoneBloc,
            child: BlocConsumer<SendPhoneBloc, SendPhoneState>(
              listener: (context, state) {
                if (state.status == FormzStatus.submissionCanceled) {
                  context.read<ShowPopUpBloc>().add(
                        ShowPopUp(
                          message: state.toastMessage,
                          isSucces: false,
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
                appBar: WAppBar(
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
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        LocaleKeys.check_number.tr(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
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
                            const SizedBox(width: 4),
                            Text(
                              '+998',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                        hintText: '00 000 00 00',
                        keyBoardType: TextInputType.number,
                        textInputFormatters: [phoneFormatter],
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
      );
}
