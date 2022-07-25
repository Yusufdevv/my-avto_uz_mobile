import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  late TextEditingController passwordRecoveryController;
  @override
  void initState() {
    passwordRecoveryController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    passwordRecoveryController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          title: 'Войти',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(title: 'Восстановление пароля', description: 'Введите код подтверждения из SMS. Код подтверждения отправлено на номер'),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToBastille,
                ),
                child: Text(
                  '+998 8* *** ** 05',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              PinCodeTextField(
                onChanged: (value) {setState((){});},
                controller: passwordRecoveryController,
                length: 6,
                pinTheme: PinTheme(
                  inactiveColor: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToWhite35,
                  errorBorderColor: red,
                  activeColor: purple,
                  activeFillColor: purple,
                  selectedColor: purple,
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 44,
                  fieldWidth: 50,
                ),
                cursorColor: white,
                keyboardType: TextInputType.number,
                enableActiveFill: false,
                textStyle: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 18),
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 4),
                appContext: context,
                showCursor: true,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Text('Отправить код снова через',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 14,
                          )),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: red.withOpacity(.1),
                    ),
                    child: Text(
                      '00:59',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              WButton(
                onTap: () {},
                shadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Theme.of(context).extension<ThemedColors>()!.transparentToSolitude12
                  )
                ],
                margin: const EdgeInsets.only(bottom: 20),
                color:(passwordRecoveryController.text.isNotEmpty)?orange : Theme.of(context)
                    .extension<ThemedColors>()!
                    .veryLightGreyToEclipse ,
                text: 'Продолжить',
                border: Border.all(
                  width: 1,
                  color:   Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteToDolphin ,
                ),
              ),
            ],
          ),
        ),
      );
}
