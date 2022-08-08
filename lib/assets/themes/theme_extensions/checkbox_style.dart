import 'package:flutter/material.dart';

class CheckBoxStyle extends ThemeExtension<CheckBoxStyle> {
  final Color unselectedBackgroundColor;
  final Color unselectedBorderColor;
  final Color unselectedItemColor;
  final Color unselectedBackgroundColor1;

  const CheckBoxStyle(
      {required this.unselectedBackgroundColor,
      required this.unselectedBorderColor,
      required this.unselectedItemColor,
      required this.unselectedBackgroundColor1});

  @override
  ThemeExtension<CheckBoxStyle> copyWith(
          {Color? unselectedBackgroundColor,
          Color? unselectedBorderColor,
          Color? unselectedItemColor,
          Color? unselectedBackgroundColor1}) =>
      CheckBoxStyle(
          unselectedBackgroundColor:
              unselectedBackgroundColor ?? this.unselectedBackgroundColor,
          unselectedBorderColor:
              unselectedBackgroundColor ?? this.unselectedBorderColor,
          unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
          unselectedBackgroundColor1:
              unselectedBackgroundColor1 ?? this.unselectedBackgroundColor1);

  @override
  ThemeExtension<CheckBoxStyle> lerp(
      ThemeExtension<CheckBoxStyle>? other, double t) {
    if (other is! CheckBoxStyle) {
      return this;
    }
    return CheckBoxStyle(
        unselectedBackgroundColor1: Color.lerp(unselectedBackgroundColor1,
                other.unselectedBackgroundColor1, t) ??
            unselectedBackgroundColor1,
        unselectedBackgroundColor: Color.lerp(unselectedBackgroundColor,
                other.unselectedBackgroundColor, t) ??
            unselectedBackgroundColor,
        unselectedBorderColor:
            Color.lerp(unselectedBorderColor, other.unselectedBorderColor, t) ??
                unselectedBorderColor,
        unselectedItemColor:
            Color.lerp(unselectedItemColor, other.unselectedItemColor, t) ??
                unselectedItemColor);
  }
}
