import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class DescriptionScreen extends StatefulWidget {
  final VoidCallback onTap;

  const DescriptionScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  late TextEditingController textController;
  bool isChecked = false;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: BaseWidget(
            onTap: textController.text.isNotEmpty ? widget.onTap : () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Пожалуйста, не указывайте ссылки, цену, контактные данные и не предлагайте услуги — такое объявление не пройдет модерацию',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .aluminumToDolphin),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 124,
                    child: WTextField(
                      onChanged: (value) {},
                      hintText:
                          'Честно опишите достоинства и недостатки своего автомобиля',
                      disabledBorderColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .transparentToNightRider,
                      enabledBorderColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .transparentToNightRider,
                      borderColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .transparentToNightRider,
                      fillColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteSmokeToDark,
                      focusColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteSmokeToDark,
                      disabledColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteSmokeToDark,
                      controller: textController,
                      borderRadius: 8,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  GestureDetector(
                      onTap: () => setState(() => isChecked = !isChecked),
                      child: Row(
                        children: [
                          WCheckBox(
                              isChecked: isChecked, checkBoxColor: purple),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Не растаможен',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: greyText),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      );
}
