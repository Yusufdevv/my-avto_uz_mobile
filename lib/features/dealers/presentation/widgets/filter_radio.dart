import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/colors/color.dart';
import '../../../../assets/themes/theme_extensions/themed_colors.dart';

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
        return 'Все';
      case Category.news:
        return 'Новые';
      case Category.withMileage:
        return 'С пробегом';
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
          duration: const Duration(milliseconds: 400),
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
