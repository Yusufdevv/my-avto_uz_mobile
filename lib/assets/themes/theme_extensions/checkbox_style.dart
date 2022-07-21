import 'package:flutter/material.dart';

class CheckBoxStyle extends ThemeExtension<CheckBoxStyle> {
  final Color unselectedBackgroundColor;
  final Color unselectedBorderColor;
  const CheckBoxStyle({required this.unselectedBackgroundColor, required this.unselectedBorderColor});

  @override
  ThemeExtension<CheckBoxStyle> copyWith({Color? unselectedBackgroundColor, Color? unselectedBorderColor}) =>
      CheckBoxStyle(unselectedBackgroundColor: unselectedBackgroundColor ?? this.unselectedBackgroundColor, unselectedBorderColor: unselectedBackgroundColor ?? this.unselectedBorderColor);

  @override
  ThemeExtension<CheckBoxStyle> lerp(
      ThemeExtension<CheckBoxStyle>? other, double t) {
    if(other is !CheckBoxStyle){
      return this;
    }
    return CheckBoxStyle(unselectedBackgroundColor: Color.lerp(unselectedBackgroundColor, other.unselectedBackgroundColor, t) ?? unselectedBackgroundColor, unselectedBorderColor: Color.lerp(unselectedBorderColor, other.unselectedBorderColor, t) ?? unselectedBorderColor);
  }
}
