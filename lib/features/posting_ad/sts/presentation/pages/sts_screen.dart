import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class StsScreen extends StatefulWidget {
  final VoidCallback onTap;

  const StsScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<StsScreen> createState() => _StsScreenState();
}

class _StsScreenState extends State<StsScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WTextField(
                    onChanged: (value) {},
                    title: 'VIN (Номер кузова)',
                    hintText: 'Введите VIN (Номер кузова)',
                    suffixIcon: AppIcons.scaner,
                    borderRadius: 12,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WTextField(
                    onChanged: (value) {},
                    title: 'Государственный номер',
                    hintText: '01 | A 000 AA',
                    borderRadius: 12,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WTextField(
                    onChanged: (value) {},
                    title: 'Свидетельство о регистрации (СТС)',
                    hintText: 'Введите CTC',
                    borderRadius: 12,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WTextField(
                    onChanged: (value) {},
                    title: 'Серия и номер тех. паспорта',
                    hintText: 'AAA 0000000',
                    suffixIcon: AppIcons.scaner,
                    borderRadius: 12,
                    fillColor:
                        Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () => setState(() => isChecked = !isChecked),
                              child: WCheckBox(
                                  isChecked: isChecked, checkBoxColor: purple)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Автомобиль находится на учёте РУ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: greyText),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
