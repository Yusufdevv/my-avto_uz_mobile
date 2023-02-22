import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/usecases/change_phone_number_usecase.dart';
import 'package:auto/features/profile/domain/usecases/send_sms_verifiaction_code_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/change_phone_number/change_phone_number_bloc.dart';

import 'package:auto/features/profile/presentation/pages/my_profile/phone_verifiy_page.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberEditPage extends StatefulWidget {
  const PhoneNumberEditPage({this.phone, super.key});

  final String? phone;
  @override
  State<PhoneNumberEditPage> createState() => _PhoneNumberEditPageState();
}

class _PhoneNumberEditPageState extends State<PhoneNumberEditPage> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp('[0-9]')},
  );

  late TextEditingController phoneController;
  late ChangePhoneNumberBloc changePhoneNumberBloc;
  bool colorChange = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    phoneController = TextEditingController();
    final repo = serviceLocator<ProfileRepositoryImpl>();
    changePhoneNumberBloc = ChangePhoneNumberBloc(
        changePhoneNumberUseCase: ChangePhoneNumberUseCase(repository: repo),
        sendSmsVerificationUseCase:
            SendSmsVerificationUseCase(repository: repo));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: changePhoneNumberBloc,
        child: BlocBuilder<ChangePhoneNumberBloc, ChangePhoneNumberState>(
          builder: (context, state) => KeyboardDismisser(
            child: CustomScreen(
              child: Scaffold(
                backgroundColor: white,
                appBar: WAppBar(title: LocaleKeys.tel_number.tr()),
                body: Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 16, right: 16, bottom: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginHeader(
                            title: LocaleKeys.tel_number.tr(),
                            description:
                                LocaleKeys.we_will_send_a_verification.tr()),
                        SizedBox(height: SizeConfig.v(50)),
                        ZTextFormField(
                          disabledBorderColor: border,
                          onChanged: (value) {
                            if (value.length == 12) {
                              FocusScope.of(context).unfocus();
                            }
                            if (value.length == 11) {
                              setState(() {});
                            }
                          },
                          controller: phoneController,
                          prefixIcon: Row(
                            children: [
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(AppImages.flagUzb2)),
                              const SizedBox(width: 8),
                              Text('+998',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
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
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: WButton(
                            isLoading: state.status.isSubmissionInProgress,
                            onTap: () {
                              final phoneNumber =
                                  phoneController.text.replaceAll(' ', '');

                              if (phoneNumber.length < 9) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message:
                                          LocaleKeys.phone_n_m_be_12_d.tr(),
                                      status: PopStatus.error,
                                    ));
                              } else if (phoneNumber.length >= 9) {
                                context
                                    .read<ChangePhoneNumberBloc>()
                                    .add(SendPhoneNumberEvent(
                                        newPhoneNumber: '+998$phoneNumber',
                                        onSuccess: () {
                                          Navigator.push(
                                            context,
                                            fade(
                                                page: MultiBlocProvider(
                                              providers: [
                                                BlocProvider.value(
                                                    value:
                                                        changePhoneNumberBloc),
                                              ],
                                              child: PhoneVerifiyPage(
                                                ctx: context,
                                                phone: phoneNumber,
                                              ),
                                            )),
                                          );
                                        },
                                        onError: (message) {
                                          var error = message;
                                          if (error
                                                  .toLowerCase()
                                                  .contains('dio') ||
                                              error
                                                  .toLowerCase()
                                                  .contains('type')) {
                                            error =
                                                LocaleKeys.service_error.tr();
                                          }
                                          context
                                              .read<ShowPopUpBloc>()
                                              .add(ShowPopUp(
                                                message: error,
                                                status: PopStatus.error,
                                              ));
                                        }));
                              }
                            },
                            margin: EdgeInsets.only(
                                bottom:
                                    4 + MediaQuery.of(context).padding.bottom),
                            color: phoneController.text.length == 12
                                ? orange
                                : Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .veryLightGreyToEclipse,
                            text: LocaleKeys.continuee.tr(),
                            border: Border.all(width: 1, color: white),
                          ),
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
