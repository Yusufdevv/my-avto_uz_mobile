import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
                  title: 'Новый пароль',
                  description:
                      'Придумайте новый пароль и постарайтесь не забыть'),
              const SizedBox(
                height: 36,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                hintText: 'Новый пароль',
                controller: newPasswordController,
              ),
              const SizedBox(
                height: 16,
              ),
              ZTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                hintText: 'Подтверждение пароля',
                controller: confirmPasswordController,
              ),
              const Spacer(),
              WButton(
                onTap: () {},
                shadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .transparentToSolitude12)
                ],
                margin: const EdgeInsets.only(bottom: 20),
                color: (newPasswordController.text.isNotEmpty &&
                        confirmPasswordController.text.isNotEmpty)
                    ? orange
                    : Theme.of(context)
                        .extension<ThemedColors>()!
                        .veryLightGreyToEclipse,
                text: 'Продолжить',
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
