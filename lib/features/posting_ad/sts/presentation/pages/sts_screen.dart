import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/common/widgets/w_cupertino_switch.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class StsScreen extends StatefulWidget {
  final VoidCallback onTap;

  const StsScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<StsScreen> createState() => _StsScreenState();
}

class _StsScreenState extends State<StsScreen> {
  bool isChecked = false;
  late TextEditingController vinController;
  late TextEditingController numberController;
  late TextEditingController stsController;
  late TextEditingController passportController;

  @override
  void initState() {
    vinController = TextEditingController();
    numberController = TextEditingController();
    stsController = TextEditingController();
    passportController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    vinController.dispose();
    numberController.dispose();
    stsController.dispose();
    passportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: BaseWidget(
            onTap: vinController.text.isNotEmpty &&
                    numberController.text.length == 8 &&
                    stsController.text.isNotEmpty &&
                    passportController.text.isNotEmpty
                ? widget.onTap
                : () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                      child: ListView(
                    children: [
                      WTextField(
                        maxLength: 15,
                        hideCounterText: true,
                        keyBoardType: TextInputType.number,
                        controller: vinController,
                        onChanged: (value) {},
                        title: 'VIN (Номер кузова)',
                        hintText: 'Введите VIN (Номер кузова)',
                        suffixIcon: AppIcons.scaner,
                        borderRadius: 12,
                        fillColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        focusColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        disabledColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WTextField(
                        maxLength: 8,
                        hideCounterText: true,
                        controller: numberController,
                        onChanged: (value) {},
                        title: 'Государственный номер',
                        hintText: '01 | A 000 AA',
                        borderRadius: 12,
                        fillColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        focusColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        disabledColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WTextField(
                        maxLength: 15,
                        hideCounterText: true,
                        controller: stsController,
                        onChanged: (value) {},
                        title: 'Свидетельство о регистрации (СТС)',
                        hintText: 'Введите CTC',
                        borderRadius: 12,
                        fillColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        focusColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        disabledColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WTextField(
                        maxLength: 15,
                        hideCounterText: true,
                        controller: passportController,
                        onChanged: (value) {},
                        title: 'Серия и номер тех. паспорта',
                        hintText: 'AAA 0000000',
                        suffixIcon: AppIcons.scaner,
                        borderRadius: 12,
                        fillColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        focusColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        disabledColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => setState(() => isChecked = !isChecked),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Автомобиль находится на учёте РУ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: greyText),
                            ),
                            WCupertinoSwitch(onChange: (bool value) {  },)
                          ],
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      );
}
