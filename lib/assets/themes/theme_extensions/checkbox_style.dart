import 'package:flutter/material.dart';

class CheckBoxStyle extends ThemeExtension<CheckBoxStyle> {
  final Color unselectedBackgroundColor;

  const CheckBoxStyle({required this.unselectedBackgroundColor});

  @override
  ThemeExtension<CheckBoxStyle> copyWith({Color? backgroundColor}) =>
      CheckBoxStyle(unselectedBackgroundColor: backgroundColor ?? unselectedBackgroundColor);

  @override
  ThemeExtension<CheckBoxStyle> lerp(
      ThemeExtension<CheckBoxStyle>? other, double t) {
    if(other is !CheckBoxStyle){
      return this;
    }
    return CheckBoxStyle(unselectedBackgroundColor: Color.lerp(unselectedBackgroundColor, other.unselectedBackgroundColor, t) ?? unselectedBackgroundColor);
  }
}
