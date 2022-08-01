import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Titlelizer extends StatelessWidget {
  final bool isOptional;
  final Widget _child;
  final bool isLast;
  final double? bottomSpace;

  const Titlelizer({
    this.isOptional = false,
    required Widget child,
    this.isLast = false,
    this.bottomSpace,
    Key? key,
  })  : _child = child,
        super(key: key);

  Titlelizer.button(
      {required BuildContext context,
      required VoidCallback onTap,
      String text = '',
      this.isOptional = false,
      bool isMultiSelectable = false,
      this.isLast = false,
      this.bottomSpace,
      Widget? child,
      Key? key})
      : _child = WButton(
          height: 44,
          onTap: onTap,
          color: white,
          border: Border.all(color: purple),
          borderRadius: 6,
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: child ??
                    Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: grey),
                    ),
              ),
              SvgPicture.asset(
                  isMultiSelectable ? AppIcons.alert : AppIcons.alert)
            ],
          ),
        ),
        super(key: key);

  Titlelizer.textField({
    this.isOptional = false,
    TextEditingController? controller,
    required ValueChanged<String> onChanged,
    EdgeInsets? suffixPadding,
    Widget? suffix,
    double? height,
    bool hasError = false,
    String? hintText,
    int? maxlines,
    int? maxLength,
    Color? fillColor,
    TextInputType? keyboardType,
    this.bottomSpace,
    this.isLast = false,
    Key? key,
  })  : _child = WTextField(
          suffixSize: suffix != null ? 100 : null,
          hasError: hasError,
          hideCounterText: true,
          suffixPadding:
              suffixPadding ?? const EdgeInsets.symmetric(vertical: 8),
          maxLines: maxlines,
          suffixRightPosition: 8,
          textInputFormatters:
              keyboardType != null && keyboardType == TextInputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [],
          contentPadding:
              EdgeInsets.fromLTRB(16, 8, suffix != null ? 0 : 16, 8),
          keyBoardType: keyboardType,
          controller: controller,
          onChanged: onChanged,
          height: height ?? 44,
          suffix: suffix,
          maxLength: maxLength,
          borderColor: purple,
          hintText: hintText,
          fillColor: fillColor ?? white,
        ),
        super(key: key);

  Titlelizer.doubleTextField({
    Key? key,
    Color? fillColor = white,
    this.isOptional = false,
    this.isLast = false,
    required TextEditingController firstTextController,
    required TextEditingController secondTextController,
    String firstHint = '',
    String secondHint = '',
    int? maxLength,
    Widget? firstSuffix,
    Function(String)? onChangedFirst,
    Function(String)? onChangedSecond,
    double? firstSuffixSize,
    Widget? secondSuffix,
    double? secondSuffixSize,
    this.bottomSpace,
  })  : _child = Row(
          children: [
            Expanded(
              child: WTextField(
                maxLength: maxLength,
                hintText: firstHint,
                fillColor: fillColor,
                textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyBoardType: TextInputType.number,
                borderRadius: 0,
                hideCounterText: true,
                height: 44,
                borderColor: blue,
                enabledBorderColor: purple,
                detailedBorderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(6)),
                controller: firstTextController,
                onChanged: onChangedFirst ?? (text) {},
                disabledBorderColor: purple,
                suffix: firstSuffix,
                suffixRightPosition: 11,
                suffixSize: firstSuffixSize,
                suffixPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            Expanded(
              child: WTextField(
                hintText: secondHint,
                maxLength: maxLength,
                fillColor: fillColor,
                textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyBoardType: TextInputType.number,
                borderRadius: 0,
                hideCounterText: true,
                height: 44,
                borderColor: blue,
                enabledBorderColor: purple,
                suffixRightPosition: 11,
                suffixPadding: const EdgeInsets.symmetric(vertical: 12),
                detailedBorderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(6)),
                controller: secondTextController,
                onChanged: onChangedSecond ?? (text) {},
                disabledBorderColor: purple,
                suffix: secondSuffix,
                suffixSize: secondSuffixSize,
              ),
            )
          ],
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: greyText),
                children: [
                  if (isOptional) ...{
                    TextSpan(
                      text: 'LocaleKeys.optional.tr()',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: grey),
                    )
                  }
                ]),
          ),
          const SizedBox(height: 8),
          _child,
          if (!isLast) ...{SizedBox(height: bottomSpace ?? 12)}
        ],
      );
}
