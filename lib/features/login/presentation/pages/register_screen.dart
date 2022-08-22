import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/pages/verification_screen.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          title: 'Регистрация',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(
                title: 'Номер телефона',
                description: 'Мы проверим ваш номер телефона в системе',
              ),
              const SizedBox(
                height: 12,
              ),
              ZTextFormField(
                onChanged: (onChanged) {
                  setState(() {});
                },
                controller: phoneController,
                prefixIcon: Row(
                  children: [
                    Image.asset(AppImages.flagUzb),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '+998',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
                hintText: '91 234 56 78',
                keyBoardType: TextInputType.number,
                textInputFormatters: [phoneFormatter],
              ),
              const Spacer(),
              WButton(
                onTap: () => phoneController.text.isNotEmpty
                    ? Navigator.push(
                        context,
                        fade(
                            page: const VerificationScreen(
                          phone: '+998 97 777 77 77',
                        )))
                    : {},
                shadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: solitude.withOpacity(.12)),
                ],
                margin: EdgeInsets.only(
                    bottom: 4 + MediaQuery.of(context).padding.bottom),
                color: (phoneController.text.isNotEmpty)
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
