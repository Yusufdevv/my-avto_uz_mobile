import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/pages/new_password_screen.dart';
import 'package:auto/features/login/presentation/widgets/add_photo_item.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/personal_data_item.dart';
import 'package:auto/features/login/presentation/widgets/region_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: WAppBar(
            title: LocaleKeys.register.tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginHeader(
                  title: LocaleKeys.personal_data.tr(),
                  description: LocaleKeys.complete_registration.tr(),
                  hasSizedBox: false,
                ),
                const SizedBox(
                  height: 36,
                ),
                const AddPhotoItem(),
                PersonalDataItem(
                  title: LocaleKeys.name.tr(),
                  controller: nameController,
                  hintText: LocaleKeys.password.tr(),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const RegionButton(
                  title: '',
                ),
                PersonalDataItem(
                  title: 'Email',
                  controller: emailController,
                  hintText: LocaleKeys.email_example.tr(),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: WButton(
                    onTap: () {
                      if (nameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        context.read<RegisterBloc>().add(
                              RegisterEvent.setName(
                                fullName: nameController.text,
                                email: emailController.text,
                                onSuccess: () {
                                  Navigator.push(
                                    context,
                                    fade(
                                      page: BlocProvider.value(
                                        value: context.read<RegisterBloc>(),
                                        child: NewPasswordScreen(
                                          onSubmit:
                                              (password, confirmPassword) {
                                            context.read<RegisterBloc>().add(
                                                  RegisterEvent.register(
                                                    validPassword: password,
                                                    onSuccess: () {
                                                      context
                                                          .read<
                                                              AuthenticationBloc>()
                                                          .add(AuthenticationStatusChanged(
                                                              status: AuthenticationStatus
                                                                  .authenticated));
                                                    },
                                                  ),
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                      } else {}
                    },
                    shadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: solitude.withOpacity(.12)),
                    ],
                    color: (nameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty)
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
              ],
            ),
          ),
        ),
      );
}
