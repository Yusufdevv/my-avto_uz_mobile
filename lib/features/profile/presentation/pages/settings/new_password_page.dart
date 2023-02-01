import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class NewPasswordsPage extends StatelessWidget {
  NewPasswordsPage({Key? key}) : super(key: key);

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPassword1Controller = TextEditingController();
  final TextEditingController _newPassword2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: CustomScreen(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: white,
            appBar: WAppBar(
              textWithButton: LocaleKeys.change_password.tr(),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.h(16),
                  right: SizeConfig.h(16),
                  top: SizeConfig.v(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LocaleKeys.change_password.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(fontSize: 32),
                        ),
                        SizedBox(height: SizeConfig.v(6)),
                        Text(LocaleKeys.create_unfoget.tr(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(height: SizeConfig.v(36)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.old_password.tr(),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        SizedBox(height: SizeConfig.v(8)),
                        PasswordTextField(
                          isOldPasword: true,
                          controller: _oldPasswordController,
                          hintText: LocaleKeys.write_old_password.tr(),
                        ),
                        SizedBox(height: SizeConfig.v(20)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.new_password.tr(),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        SizedBox(height: SizeConfig.v(8)),
                        PasswordTextField(
                          secondController: _newPassword2Controller,
                          controller: _newPassword1Controller,
                          hintText: LocaleKeys.enter_Passowrd.tr(),
                        ),
                        SizedBox(height: SizeConfig.v(20)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.confirm_password.tr(),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        SizedBox(height: SizeConfig.v(8)),
                        PasswordTextField(
                          secondController: _newPassword1Controller,
                          controller: _newPassword2Controller,
                          hintText: LocaleKeys.write_again.tr(),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) => Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.v(24) +
                              MediaQuery.of(context).viewInsets.bottom),
                      child: WButton(
                        border: Border.all(width: 1, color: white),
                        color: _oldPasswordController.text.length < 6 &&
                                _newPassword1Controller.text.length < 6 &&
                                _newPassword2Controller.text.length < 6
                            ? Theme.of(context)
                                .extension<ThemedColors>()!
                                .veryLightGreyToEclipse
                            : orange,
                        isLoading: state.changeStatus.isSubmissionInProgress,
                        onTap: () {
                          if (_oldPasswordController.text.length < 6 ||
                              _newPassword1Controller.text.length < 6 ||
                              _newPassword2Controller.text.length < 6) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                message: LocaleKeys.password_must_6.tr(),
                                isSucces: false));
                          } else if (_oldPasswordController.text.isEmpty ||
                              _newPassword1Controller.text.isEmpty ||
                              _newPassword2Controller.text.isEmpty) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                message: LocaleKeys.password_must_6.tr(),
                                isSucces: false));
                          } else if (_oldPasswordController.text.length >= 6 &&
                              _newPassword1Controller.text.length >= 6 &&
                              _newPassword2Controller.text.length >= 6) {
                            if (_newPassword1Controller.text !=
                                _newPassword2Controller.text) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message:
                                      LocaleKeys.passwords_didnt_match.tr(),
                                  isSucces: false));
                            } else {
                              context.read<ProfileBloc>().add(
                                    ChangePasswordEvent(
                                      newPassword: _newPassword1Controller.text,
                                      oldPassword: _oldPasswordController.text,
                                      newPasswordConfirm:
                                          _newPassword2Controller.text,
                                      onSuccess: (message) {
                                        context.read<ShowPopUpBloc>().add(ShowPopUp(
                                            message: message.isNotEmpty
                                                ? message
                                                : LocaleKeys
                                                    .password_changed_successfully
                                                    .tr(),
                                            isSucces: true));
                                        //after pasword changing get new token
                                        context.read<ProfileBloc>().add(
                                            LoginUser(
                                                password:
                                                    _newPassword1Controller
                                                        .text,
                                                phone: state
                                                    .profileEntity.phoneNumber!
                                                    .replaceAll('+998', '')
                                                    .replaceAll('', ' ')));
                                        Navigator.of(context).pop();
                                      },
                                      onError: (message) {
                                        var error = message;
                                        if (error
                                            .toLowerCase()
                                            .contains('dioerror')) {
                                          error = LocaleKeys.service_error.tr();
                                        }
                                        context.read<ShowPopUpBloc>().add(
                                            ShowPopUp(
                                                message: error,
                                                isSucces: false));
                                      },
                                    ),
                                  );
                            }
                          }
                        },
                        child: Text(
                          LocaleKeys.further.tr(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
