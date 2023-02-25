import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/register_user.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/pages/register/register_verification_screen.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/terms_of_use_and_rules.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  late TextEditingController phoneController;
  late RegisterBloc registerBloc;

  @override
  void initState() {
    registerBloc = RegisterBloc(
        sendCodeUseCase: SendCodeUseCase(),
        registerUseCase: RegisterUseCase(),
        verifyCodeUseCase: VerifyCodeUseCase());
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  // register screen -1

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: BlocProvider.value(
          value: registerBloc,
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
                      title: LocaleKeys.tel_number.tr(),
                      description: LocaleKeys.check_number.tr(),
                    ),
                    const SizedBox(height: 49),
                    ZTextFormField(
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
                                    fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      hintText: '00 000 00 00',
                      hintTextStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14,
                              color: warmerGrey,
                              fontWeight: FontWeight.w400),
                      keyBoardType: TextInputType.number,
                      textInputFormatters: [phoneFormatter],
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 24),
                    const TermsOfUseAndRules(),
                    const SizedBox(height: 12),
                    WButton(
                      isLoading: state.sendCodeStatus ==
                          FormzStatus.submissionInProgress,
                      onTap: () {
                        if (phoneController.text.length == 12) {
                          registerBloc.add(RegisterEvent.sendCode(
                              phoneController.text.replaceAll('+998', ''),
                              onError: (text) {
                            if (text.isNotEmpty) {
                              var error = text;
                              if (error.toLowerCase().contains('dio') ||
                                  error.toLowerCase().contains('type')) {
                                error = LocaleKeys.service_error.tr();
                              }
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: error,
                                    status: PopStatus.error,
                                  ));
                            } else {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: LocaleKeys.error_try_again.tr(),
                                    status: PopStatus.error,
                                  ));
                            }
                          }, onSuccess: (session) {
                            Navigator.push(
                                context,
                                fade(
                                    page: BlocProvider.value(
                                  value: registerBloc,
                                  child: RegisterVerificationScreen(
                                      session: session,
                                      phone: phoneController.text
                                          .replaceAll('+998', '')),
                                )));
                          }));
                        }
                      },
                      margin: EdgeInsets.only(
                          bottom: 4 + MediaQuery.of(context).padding.bottom),
                      color: (phoneController.text.length > 11)
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
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
