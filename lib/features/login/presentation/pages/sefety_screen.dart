import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({Key? key}) : super(key: key);

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;

  bool firstPasswordEmpty = true;
  bool secondPasswordEmpty = true;

  @override
  void initState() {
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.security.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               LoginHeader(
                  title: LocaleKeys.security.tr(),
                  description:
                      LocaleKeys.create_password_6.tr(),),
              const SizedBox(
                height: 36,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: passwordController,
                hintText: LocaleKeys.password.tr(),
                isObscure: true,
              ),
              const SizedBox(
                height: 16,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                hintText: LocaleKeys.password.tr(),
                isObscure: true,
                controller: repeatPasswordController,
              ),
              const Spacer(),
              WButton(
                onTap: () => passwordController.text.isNotEmpty &&
                        repeatPasswordController.text.isNotEmpty
                    ? Navigator.pushAndRemoveUntil(context,
                        fade(page: const HomeScreen()), (route) => false)
                    : {},
                margin: EdgeInsets.only(
                    bottom: 4 + MediaQuery.of(context).padding.bottom),
                color: (passwordController.text.isNotEmpty &&
                        repeatPasswordController.text.isNotEmpty)
                    ? orange
                    : Theme.of(context)
                        .extension<ThemedColors>()!
                        .veryLightGreyToEclipse,
                text: LocaleKeys.continuee.tr(),
                shadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: solitude.withOpacity(.12)),
                ],
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
      );
}
