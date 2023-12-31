import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class NewPasswordScreen extends StatefulWidget {
  final Function(String, String) onSubmit;

  const NewPasswordScreen({required this.onSubmit, Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  bool isShowingToast = false;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) => CustomScreen(
            child: Scaffold(
              backgroundColor: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
              appBar: WAppBar(
                title: LocaleKeys.security.tr(),
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
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        LoginHeader(
                          title: LocaleKeys.security.tr(),
                          description: LocaleKeys.create_password_6.tr(),
                        ),
                        const SizedBox(height: 36),
                        ZTextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          textInputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[\da-zA-Z!@#$&*~]')),
                          ],
                          isObscure: true,
                          hintText: LocaleKeys.new_password.tr(),
                          controller: newPasswordController,
                          hintTextStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14,
                                  color: warmerGrey,
                                  fontWeight: FontWeight.w400),
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 16),
                        ZTextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          textInputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[\da-zA-Z!@#$&*~]')),
                          ],
                          isObscure: true,
                          hintText: LocaleKeys.confirm_password.tr(),
                          controller: confirmPasswordController,
                          hintTextStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14,
                                  color: warmerGrey,
                                  fontWeight: FontWeight.w400),
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 36),
                        WButton(
                          isDisabled: newPasswordController.text.length < 6 ||
                              confirmPasswordController.text.length < 6 &&
                                  newPasswordController.text !=
                                      confirmPasswordController.text,
                          isLoading: state.registerStatus ==
                              FormzStatus.submissionInProgress,
                          onTap: () {
                            if (newPasswordController.text.length >= 6 &&
                                confirmPasswordController.text.length >= 6) {
                              if (newPasswordController.text ==
                                  confirmPasswordController.text) {
                                widget.onSubmit(newPasswordController.text,
                                    confirmPasswordController.text);
                              } else {
                                context.read<ShowPopUpBloc>().add(
                                      ShowPopUp(
                                        message: LocaleKeys
                                            .passwords_didnt_match
                                            .tr(),
                                        status: PopStatus.error,
                                      ),
                                    );
                                isShowingToast = true;
                              }
                            } else {
                              context.read<ShowPopUpBloc>().add(
                                    ShowPopUp(
                                      message: LocaleKeys.password_must_6.tr(),
                                      status: PopStatus.error,
                                    ),
                                  );
                            }
                          },
                          margin: EdgeInsets.only(
                              bottom:
                                  4 + MediaQuery.of(context).padding.bottom),
                          color: orange,
                          disabledColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToEclipse,
                          border: Border.all(width: 1, color: Theme.of(context).extension<ThemedColors>()!.whiteToEclipse),
                          text: LocaleKeys.continuee.tr(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
