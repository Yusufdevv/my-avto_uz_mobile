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

class NewPasswordsPage extends StatelessWidget {
  final ProfileBloc profileBloc;

  NewPasswordsPage({required this.profileBloc, Key? key}) : super(key: key);

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPassword1Controller = TextEditingController();
  final TextEditingController _newPassword2Controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child: KeyboardDismisser(
          child: CustomScreen(
            child: Scaffold(
              backgroundColor: white,
              appBar: WAppBar(
                textWithButton: LocaleKeys.change_password.tr(),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Padding(
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
                                    ?.copyWith(fontSize: SizeConfig.h(32)),
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
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) => Padding(
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.h(16),
                      0,
                      SizeConfig.h(16),
                      SizeConfig.v(24) +
                          MediaQuery.of(context).viewInsets.bottom),
                  child: WButton(
                    shadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                        color: orange.withOpacity(0.2),
                      ),
                    ],
                    isLoading: state.changeStatus.isSubmissionInProgress,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ProfileBloc>().add(
                              ChangePasswordEvent(
                                newPassword: _newPassword1Controller.text,
                                oldPassword: _oldPasswordController.text,
                                newPasswordConfirm:
                                    _newPassword2Controller.text,
                                onSuccess: (message) {
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message:
                                          "Parol muvaffaqiyatli o'zgartirildi",
                                      isSucces: true));
                                  //after pasword changing get new token
                                  context.read<ProfileBloc>().add(LoginUser(
                                      password: _newPassword1Controller.text,
                                      phone: state.profileEntity.phoneNumber!
                                          .replaceAll('+998', '')
                                          .replaceAll('', ' ')));
                                  Navigator.of(context).pop();
                                },
                                onError: (message) {
                                  context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message: message, isSucces: false));
                                },
                              ),
                            );
                      }
                    },
                    child: Text(
                      LocaleKeys.further.tr(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
