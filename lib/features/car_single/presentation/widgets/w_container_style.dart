import 'package:flutter/material.dart';

class WContainerStyle extends ThemeExtension<WContainerStyle> {
  final Color fillColor;
  final Color borderColor;
  final BoxShadow boxShadow;

  const WContainerStyle({
    required this.fillColor,
    required this.borderColor,
    required this.boxShadow,
  });

  @override
  WContainerStyle copyWith({
    Color? fillColor,
    Color? borderColor,
    BoxShadow? boxShadow,
  }) => WContainerStyle(
      fillColor: fillColor ?? this.fillColor,
      borderColor: borderColor ?? this.borderColor,
      boxShadow: boxShadow ?? this.boxShadow,
    );

  @override
  ThemeExtension<WContainerStyle> lerp(
      ThemeExtension<WContainerStyle>? other, double t) {
    if (other is! WContainerStyle) {
      return this;
    }

    return WContainerStyle(
      fillColor: Color.lerp(fillColor, other.fillColor, t) ?? fillColor,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      boxShadow: BoxShadow.lerp(boxShadow, other.boxShadow, t) ?? boxShadow,
    );
  }
}
