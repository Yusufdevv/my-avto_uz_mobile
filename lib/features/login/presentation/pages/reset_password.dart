import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: const WAppBar(
            title: 'Забыли пароль',
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Text(
                  'Восстановление пароля',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Мы проверим ваш номер телефона в системе',
                  style: Theme.of(context).textTheme.headline2,
                ),
                ZTextFormField(
                  onChanged: (onChanged) {
                    setState(() {});
                  },
                  controller: phoneController,
                  prefixIcon: Row(
                    children: [
                      Image.asset(AppImages.flagUzb),
                      const SizedBox(width: 4),
                      Text(
                        '+998',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  hintText: '00 000 00 00',
                  keyBoardType: TextInputType.number,
                  textInputFormatters: [phoneFormatter],
                ),
                const SizedBox(height: 36),
                WButton(
                  isDisabled: phoneController.text.length != 12,
                  text: 'Продолжить',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
}
