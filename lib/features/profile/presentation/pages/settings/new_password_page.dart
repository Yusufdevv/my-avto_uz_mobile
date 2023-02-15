import 'package:auto/assets/colors/color.dart';
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

class NewPasswordsPage extends StatefulWidget {
 const NewPasswordsPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordsPage> createState() => _NewPasswordsPageState();
}

class _NewPasswordsPageState extends State<NewPasswordsPage> {
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
                              .displayLarge
                              ?.copyWith(fontSize: 32),
                        ),
                        SizedBox(height: SizeConfig.v(6)),
                        Text(LocaleKeys.create_unfoget.tr(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium),
                        SizedBox(height: SizeConfig.v(36)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.old_password.tr(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        SizedBox(height: SizeConfig.v(8)),
                        PasswordTextField(
                          onChanged: (value) => setState(() {}),
                          isOldPasword: true,
                          controller: _oldPasswordController,
                          hintText: LocaleKeys.write_old_password.tr(),
                        ),
                        SizedBox(height: SizeConfig.v(20)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.new_password.tr(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        SizedBox(height: SizeConfig.v(8)),
                        PasswordTextField(
                          onChanged: (value) => setState(() {}),
                          secondController: _newPassword2Controller,
                          controller: _newPassword1Controller,
                          hintText: LocaleKeys.enter_Passowrd.tr(),
                        ),
                        SizedBox(height: SizeConfig.v(20)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.confirm_password.tr(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        SizedBox(height: SizeConfig.v(8)),
                        PasswordTextField(
                          onChanged: (value) => setState(() {}),
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
                        color: _oldPasswordController.text.length > 5 &&
                                _newPassword1Controller.text.length > 5 &&
                                _newPassword2Controller.text.length > 5
                            ? orange
                            : disabledButton,
                        isLoading: state.changeStatus.isSubmissionInProgress,
                        onTap: () {
                          if (_oldPasswordController.text.length < 6 ||
                              _newPassword1Controller.text.length < 6 ||
                              _newPassword2Controller.text.length < 6) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: LocaleKeys.password_must_6.tr(),
                                  status: PopStatus.error,
                                ));
                          } else if (_oldPasswordController.text.isEmpty ||
                              _newPassword1Controller.text.isEmpty ||
                              _newPassword2Controller.text.isEmpty) {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: LocaleKeys.password_must_6.tr(),
                                  status: PopStatus.error,
                                ));
                          } else if (_oldPasswordController.text.length >= 6 &&
                              _newPassword1Controller.text.length >= 6 &&
                              _newPassword2Controller.text.length >= 6) {
                            if (_newPassword1Controller.text !=
                                _newPassword2Controller.text) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message:
                                        LocaleKeys.passwords_didnt_match.tr(),
                                    status: PopStatus.error,
                                  ));
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
                                            status: PopStatus.success));
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
                                                .contains('dio') ||
                                            error
                                                .toLowerCase()
                                                .contains('type')) {
                                          error = LocaleKeys.service_error.tr();
                                        }
                                        context
                                            .read<ShowPopUpBloc>()
                                            .add(ShowPopUp(
                                              message: error,
                                              status: PopStatus.error,
                                            ));
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
