import 'package:flutter/material.dart';

class ThemedColors extends ThemeExtension<ThemedColors> {
  final Color whiteToWhiteOpacity20;
  final Color dividerColorToGrey;

  const ThemedColors(
      {required this.dividerColorToGrey, required this.whiteToWhiteOpacity20});

  @override
  ThemeExtension<ThemedColors> copyWith(
          {Color? whiteToWhiteOpacity20, Color? dividerColorToGrey}) =>
      ThemedColors(
          dividerColorToGrey: dividerColorToGrey ?? this.dividerColorToGrey,
          whiteToWhiteOpacity20:
              whiteToWhiteOpacity20 ?? this.whiteToWhiteOpacity20);

  @override
  ThemeExtension<ThemedColors> lerp(
      ThemeExtension<ThemedColors>? other, double t) {
    if (other is! ThemedColors) {
      return this;
    }
    return ThemedColors(
        dividerColorToGrey:
            Color.lerp(dividerColorToGrey, other.dividerColorToGrey, t) ??
                dividerColorToGrey,
        whiteToWhiteOpacity20:
            Color.lerp(whiteToWhiteOpacity20, other.whiteToWhiteOpacity20, t) ??
                whiteToWhiteOpacity20);
  }
}
