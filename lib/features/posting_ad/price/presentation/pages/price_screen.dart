import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PriceScreen extends StatefulWidget {
  final VoidCallback onTap;

  const PriceScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late TextEditingController priceController;
  @override
  void initState() {
    priceController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: BaseWidget(
            onTap: priceController.text.isEmpty ? (){} : widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  WTextField(
                    maxLength: 7,
                    hideCounterText: true,
                    controller: priceController,
                    onChanged: (value) {},
                    title: 'Введите сумму',
                    keyBoardType: TextInputType.number,
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
                    suffixPadding: const EdgeInsets.all(0),
                    suffix: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .solitudeToEclipse,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(12),
                          ),
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor)),
                      child: WButton(
                        onTap: () {},
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'y.e',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: greyText),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(AppIcons.chevronDown)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .snowToNero,
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .transparentToNightRider),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Стоимость такого же авто начинается с:',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: grey),
                        ),
                        Text('≈ 270 000 у.е', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600, fontSize: 14),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
