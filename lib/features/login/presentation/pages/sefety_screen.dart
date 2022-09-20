import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
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
        appBar: const WAppBar(
          title: 'Безопасность',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(
                  title: 'Безопасность',
                  description:
                      'Придумайте пароль для входа (минимум 6 символов)'),
              const SizedBox(
                height: 36,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: passwordController,
                hintText: 'Пароль',
                isObscure: true,
              ),
              const SizedBox(
                height: 16,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                hintText: 'Пароль',
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
                text: 'Продолжить',
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
