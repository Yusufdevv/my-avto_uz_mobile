import 'package:flutter/material.dart';

class CancelButtonStyle extends ThemeExtension<CancelButtonStyle> {
  final Color backgroundColor;
  final Color onButtonColor;

  const CancelButtonStyle({
    required this.backgroundColor,
    required this.onButtonColor,
  });

  @override
  CancelButtonStyle copyWith({
    Color? backgroundColor,
    Color? onButtonColor,
  }) {
    return CancelButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      onButtonColor: onButtonColor ?? this.onButtonColor,
    );
  }

  @override
  ThemeExtension<CancelButtonStyle> lerp(
      ThemeExtension<CancelButtonStyle>? other, double t) {
    if (other is! CancelButtonStyle) {
      return this;
    }

    return CancelButtonStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      onButtonColor:
      Color.lerp(onButtonColor, other.onButtonColor, t) ?? onButtonColor,
    );
  }
}
