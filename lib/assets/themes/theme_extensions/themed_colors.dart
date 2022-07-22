import 'package:flutter/material.dart';

class ThemedColors extends ThemeExtension<ThemedColors> {
  final Color whiteToWhiteOpacity20;
  final Color dividerColorToGrey;
  final Color veryLightGreyToEclipse;
  final Color whiteToDolphin;
  const ThemedColors(
      {required this.dividerColorToGrey, required this.whiteToDolphin, required this.veryLightGreyToEclipse, required this.whiteToWhiteOpacity20});

  @override
  ThemeExtension<ThemedColors> copyWith(
          {Color? whiteToWhiteOpacity20, Color? dividerColorToGrey, Color? veryLightGreyToEclipse, Color? whiteToDolphin}) =>
      ThemedColors(
          dividerColorToGrey: dividerColorToGrey ?? this.dividerColorToGrey,
          whiteToDolphin: whiteToDolphin ?? this.whiteToDolphin,
          whiteToWhiteOpacity20:
              whiteToWhiteOpacity20 ?? this.whiteToWhiteOpacity20,
          veryLightGreyToEclipse: veryLightGreyToEclipse ?? this.veryLightGreyToEclipse
      );

  @override
  ThemeExtension<ThemedColors> lerp(
      ThemeExtension<ThemedColors>? other, double t) {
    if (other is! ThemedColors) {
      return this;
    }
    return ThemedColors(
        whiteToDolphin: Color.lerp(whiteToDolphin, other.whiteToDolphin, t) ?? whiteToDolphin,
        dividerColorToGrey:
            Color.lerp(dividerColorToGrey, other.dividerColorToGrey, t) ??
                dividerColorToGrey,
        veryLightGreyToEclipse: Color.lerp(veryLightGreyToEclipse, other.veryLightGreyToEclipse, t) ?? veryLightGreyToEclipse,
        whiteToWhiteOpacity20:
            Color.lerp(whiteToWhiteOpacity20, other.whiteToWhiteOpacity20, t) ??
                whiteToWhiteOpacity20);
  }
}
