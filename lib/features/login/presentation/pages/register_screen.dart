import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/register_user.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/pages/verification_screen.dart';
import 'package:auto/features/login/presentation/widgets/SignIn_with_socials.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: registerBloc,
        child: Scaffold(
          appBar: WAppBar(
            title: LocaleKeys.register.tr(),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(
                  title: LocaleKeys.tel_number.tr(),
                  description: LocaleKeys.check_number.tr(),
                ),
                const SizedBox(
                  height: 12,
                ),
                ZTextFormField(
                  onChanged: (onChanged) {
                    setState(() {});
                  },
                  controller: phoneController,
                  prefixIcon: Row(
                    children: [
                      Image.asset(AppImages.flagUzb),
                      const SizedBox(
                        width: 4,
                      ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: LocaleKeys.i_accept_rules.tr()),
                        TextSpan(
                          text: LocaleKeys.i_accept_rules1.tr(),
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: blue,
                                  ),
                        ),
                        TextSpan(text: LocaleKeys.i_accept_rules2.tr()),
                        TextSpan(
                          text: LocaleKeys.i_accept_rules3.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: blue),
                        ),
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),

                  // Text(
                  //   '',
                  //        // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: WButton(
                    onTap: () {
                      print(phoneController.text.length);
                      if (phoneController.text.length == 12) {
                        registerBloc.add(RegisterEvent.sendCode(
                            phoneController.text.replaceAll('+998', ''),
                            onSuccess: (session) {
                          Navigator.push(
                              context,
                              fade(
                                  page: BlocProvider.value(
                                value: registerBloc,
                                child: VerificationScreen(
                                  ischangePhoneNumber: true,
                                    session: session,
                                    phone: phoneController.text
                                        .replaceAll('+998', '')),
                              )));
                        }));
                      } else {}
                    },
                    shadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: solitude.withOpacity(.12)),
                    ],
                    margin: EdgeInsets.only(
                        bottom: 4 + MediaQuery.of(context).padding.bottom),
                    color: (phoneController.text.isNotEmpty)
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
      
      );
}
