import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FilterRadio extends StatelessWidget {
  final Category value;
  final ValueChanged<Category> onChanged;
  final Category currentValue;

  const FilterRadio(
      {required this.value,
      required this.onChanged,
      required this.currentValue,
      Key? key})
      : super(key: key);

  String getCategory(Category category) {
    switch (category) {
      case Category.all:
        return LocaleKeys.all.tr();
      case Category.news:
        return LocaleKeys.news.tr();
      case Category.withMileage:
        return LocaleKeys.with_Mileage.tr();
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onChanged(value);
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          height: 36,
          padding: const EdgeInsets.only(
            right: 12,
          ),
          decoration: BoxDecoration(
            color: currentValue == value
                ? purple.withOpacity(0.1)
                : Theme.of(context)
                    .extension<ThemedColors>()!
                    .whiteSmokeToEclipse,
            borderRadius: BorderRadius.circular(46),
            border: Border.all(
                color: currentValue == value
                    ? purple
                    : Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToEclipse),
          ),
          duration: const Duration(milliseconds: 200),
          child: Row(
            children: [
              Radio(
                  splashRadius: 0,
                  activeColor: purple,
                  value: value,
                  groupValue: currentValue,
                  onChanged: (Category? radioValue) {
                    onChanged(radioValue ?? value);
                  }),
              Text(
                getCategory(value),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: currentValue == value
                        ? Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToWhite
                        : grey),
              ),
            ],
          ),
        ),
      );
}
