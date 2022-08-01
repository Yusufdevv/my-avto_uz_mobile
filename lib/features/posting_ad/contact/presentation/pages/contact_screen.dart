import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactScreen extends StatefulWidget {
  final VoidCallback onTap;

  const ContactScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController numberController;

  @override
  void initState() {
    numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
    child: Scaffold(
          body: BaseWidget(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  WTextField(
                    onChanged: (value) {},
                    title: 'Имя',
                    hintText: 'Введите имя',
                    borderRadius: 12,
                    borderColor: Theme.of(context)
                        .extension<WTextFieldStyle>()!
                        .borderColor,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                    focusColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WTextField(
                    onChanged: (value) {},
                    title: 'E-mail',
                    hintText: 'Введите электронную почту',
                    borderRadius: 12,
                    borderColor: Theme.of(context)
                        .extension<WTextFieldStyle>()!
                        .borderColor,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                    focusColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WTextField(
                    onChanged: (value) {setState((){});},
                    title: 'Номер телефона',
                    controller: numberController,
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8, top: 13),
                      child: Text(
                        '+998',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    hintText: '_ _  _ _ _  _ _  _ _',
                    borderRadius: 12,
                    borderColor: Theme.of(context)
                        .extension<WTextFieldStyle>()!
                        .borderColor,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                    focusColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                    textInputFormatters: [phoneFormatter],
                    suffix: WButton(
                      color: (numberController.text.length > 9)?orange : Theme.of(context)
                          .extension<ThemedColors>()!
                          .veryLightGreyToEclipse ,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      onTap: () {},
                      text: 'Подтвердить',
                      textStyle: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: white),
                    ),
                  ),
                    const SizedBox(height: 16,),
                  const SwitcherRow(title: 'Доступные часы'),
                  const SizedBox(height: 24,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<ThemedColors>()!.snowToNero,
                      border: Border.all(
                        width: 1,
                        color:Theme.of(context).extension<ThemedColors>()!.transparentToNightRider
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text('Если вы включаете этот режим ваш контакный номер не будеть отображаться в объявление', style: Theme.of(context).textTheme.headline2!.copyWith(color: grey),),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
