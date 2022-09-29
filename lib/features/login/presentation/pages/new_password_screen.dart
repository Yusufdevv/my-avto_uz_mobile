import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
                        onChanged: (value) {
                          setState(() {});
                        },
                        isObscure: true,
                        hintText: LocaleKeys.confirm_password.tr(),
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                WButton(
                  onTap: () {
                    if ((newPasswordController.text.length >= 6 &&
                            confirmPasswordController.text.length >= 6) &&
                        newPasswordController.text ==
                            confirmPasswordController.text) {
                      widget.onSubmit(newPasswordController.text,
                          confirmPasswordController.text);
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
                  color: (newPasswordController.text.isNotEmpty &&
                          confirmPasswordController.text.isNotEmpty)
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
              ],
            ),
          ),
        ),
      );
}
