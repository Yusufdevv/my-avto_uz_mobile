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

  void hidePopUp() {
    if (isShowingToast) {
      context.read<ShowPopUpBloc>().add(HidePopUp());
      isShowingToast = false;
    }
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) => CustomScreen(
            child: Scaffold(
              appBar: WAppBar(
                title: LocaleKeys.security.tr(),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          LoginHeader(
                            title: LocaleKeys.new_password.tr(),
                            description: LocaleKeys.create_password.tr(),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          ZTextFormField(
                            onTap: hidePopUp,
                            onChanged: (value) {
                              setState(() {});
                            },
                            isObscure: true,
                            hintText: LocaleKeys.new_password.tr(),
                            controller: newPasswordController,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ZTextFormField(
                            onTap: hidePopUp,
                            onChanged: (value) {
                              setState(() {});
                            },
                            isObscure: true,
                            hintText: LocaleKeys.confirm_password.tr(),
                            controller: confirmPasswordController,
                          ),
                          const SizedBox(height: 36),
                          WButton(
                            isDisabled: newPasswordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty,
                            isLoading: state.registerStatus ==
                                FormzStatus.submissionInProgress,
                            onTap: () {
                              print('tap');
                              if ((newPasswordController.text.length >= 6 &&
                                      confirmPasswordController.text.length >=
                                          6) &&
                                  newPasswordController.text ==
                                      confirmPasswordController.text) {
                                widget.onSubmit(newPasswordController.text,
                                    confirmPasswordController.text);
                              } else {
                                context.read<ShowPopUpBloc>().add(
                                      ShowPopUp(
                                        message:
                                            'Пароли не совпали, повторите попытку еще раз',
                                        isSucces: false,
                                        dismissible: false,
                                      ),
                                    );
                                isShowingToast = true;
                              }
                            },
                            shadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 20,
                                  color: solitude.withOpacity(.12)),
                            ],
                            margin: EdgeInsets.only(
                                bottom:
                                    4 + MediaQuery.of(context).padding.bottom),
                            color: orange,
                            disabledColor: Theme.of(context)
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
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
