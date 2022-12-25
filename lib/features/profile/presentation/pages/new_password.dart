import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/password_textfield.dart';
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

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child: KeyboardDismisser(
          child: CustomScreen(
            child: Scaffold(
              appBar: WAppBar(
                textWithButton: LocaleKeys.change_password.tr(),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.h(16),
                      right: SizeConfig.h(16),
                      top: SizeConfig.v(24)),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.change_password.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: SizeConfig.h(32)),
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
                        controller: _newPassword2Controller,
                        hintText: LocaleKeys.write_again.tr(),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) => WButton(
                  shadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                      color: orange.withOpacity(0.2),
                    ),
                  ],
                  isLoading: state.changeStatus.isSubmissionInProgress,
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.h(16),
                      SizeConfig.v(24),
                      SizeConfig.h(16),
                      SizeConfig.v(24) +
                          MediaQuery.of(context).viewInsets.bottom),
                  onTap: () {
                    context.read<ProfileBloc>().add(
                          ChangePasswordEvent(
                            newPassword: _newPassword1Controller.text,
                            oldPassword: _oldPasswordController.text,
                            newPasswordConfirm: _newPassword2Controller.text,
                            onSuccess: (message) {
                              // Navigator.of(context, rootNavigator: true).push(
                              //   fade(
                              //     page: const SmsCodePage(
                              //         phone: '+998 88 033 18 05'),
                              //   ),
                              // );
                              context
                                  .read<ShowPopUpBloc>()
                                  .add(ShowPopUp(message: message, isSucces: true));
                              Navigator.of(context).pop();
                            },
                            onError: (message) {
                              context
                                  .read<ShowPopUpBloc>()
                                  .add(ShowPopUp(message: message, isSucces: false));
                            },
                          ),
                        );
                  },
                  child: Text(
                    LocaleKeys.further.tr(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
