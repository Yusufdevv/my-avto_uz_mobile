import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/image/image_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
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
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late ImageBloc imageBloc;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    imageBloc = ImageBloc(ImagePicker());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    imageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: KeyboardDismisser(
          child: BlocProvider.value(
            value: imageBloc,
            child: Scaffold(
              backgroundColor: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
              resizeToAvoidBottomInset: false,
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 16 + MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginHeader(
                        title: LocaleKeys.personal_data.tr(),
                        description: LocaleKeys.complete_registration.tr(),
                        hasSizedBox: false,
                      ),
                      const SizedBox(height: 36),
                      const AddPhotoItem(),
                      PersonalDataItemm(
                        isRequired: true,
                        onTap: () {},
                        title: LocaleKeys.full_name.tr(),
                        controller: nameController,
                        hintText: LocaleKeys.enter_fullname.tr(),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      RegionButton(
                        onTap: () {},
                        title: '',
                      ),
                      PersonalDataItemm(
                        onTap: () {},
                        title: LocaleKeys.email.tr(),
                        controller: emailController,
                        hintText: 'example@auto.uz',
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 24),
                      WButton(
                        onTap: () {
                          if (nameController.text.isNotEmpty) {
                            if (emailController.text.isNotEmpty) {
                              if (!MyFunctions.isEmail(
                                  emailController.text.trim())) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: LocaleKeys.please_enter_valid_email
                                        .tr(),
                                    status: PopStatus.error,
                                    dismissible: false));
                              } else {
                                context.read<RegisterBloc>().add(
                                      RegisterEvent.setName(
                                        fullName: nameController.text,
                                        email: emailController.text,
                                        onSuccess: () {
                                          Navigator.push(
                                            context,
                                            fade(
                                              page: BlocProvider.value(
                                                value: context
                                                    .read<RegisterBloc>(),
                                                child: NewPasswordScreen(
                                                  onSubmit: (password,
                                                      confirmPassword) {
                                                    context
                                                        .read<RegisterBloc>()
                                                        .add(
                                                          RegisterEvent
                                                              .register(
                                                            validPassword:
                                                                password,
                                                            onError: (text) {
                                                              var error = text;
                                                              if (error
                                                                      .toLowerCase()
                                                                      .contains(
                                                                          'dio') ||
                                                                  error
                                                                      .toLowerCase()
                                                                      .contains(
                                                                          'type')) {
                                                                error = LocaleKeys
                                                                    .service_error
                                                                    .tr();
                                                              }
                                                              context
                                                                  .read<
                                                                      ShowPopUpBloc>()
                                                                  .add(
                                                                      ShowPopUp(
                                                                    message:
                                                                        error,
                                                                    status:
                                                                        PopStatus
                                                                            .error,
                                                                  ));
                                                            },
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
                              }
                            } else {
                              context.read<RegisterBloc>().add(
                                    RegisterEvent.setName(
                                      fullName: nameController.text,
                                      email: emailController.text,
                                      onSuccess: () {
                                        Navigator.push(
                                          context,
                                          fade(
                                            page: BlocProvider.value(
                                              value:
                                                  context.read<RegisterBloc>(),
                                              child: NewPasswordScreen(
                                                onSubmit: (password,
                                                    confirmPassword) {
                                                  context
                                                      .read<RegisterBloc>()
                                                      .add(
                                                        RegisterEvent.register(
                                                          validPassword:
                                                              password,
                                                          onError: (text) {
                                                            var error = text;
                                                            if (error
                                                                    .toLowerCase()
                                                                    .contains(
                                                                        'dio') ||
                                                                error
                                                                    .toLowerCase()
                                                                    .contains(
                                                                        'type')) {
                                                              error = LocaleKeys
                                                                  .service_error
                                                                  .tr();
                                                            }
                                                            context
                                                                .read<
                                                                    ShowPopUpBloc>()
                                                                .add(
                                                                  ShowPopUp(
                                                                    message:
                                                                        error,
                                                                    status:
                                                                        PopStatus
                                                                            .error,
                                                                  ),
                                                                );
                                                          },
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
                            }
                          } else {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: LocaleKeys.please_fullname.tr(),
                                  status: PopStatus.error,
                                ));
                          }
                        },
                        margin: const EdgeInsets.only(bottom: 4),
                        color: (nameController.text.isNotEmpty)
                            ? orange
                            : Theme.of(context)
                                .extension<ThemedColors>()!
                                .ghostToEclipse,
                        text: LocaleKeys.continuee.tr(),
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!.whiteToEclipse,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
