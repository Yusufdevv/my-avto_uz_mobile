import 'package:flutter/material.dart';

class ThemedColors extends ThemeExtension<ThemedColors> {
  final Color whiteToWhiteOpacity20;
  final Color dividerColorToGrey;
  final Color veryLightGreyToEclipse;
  final Color whiteToDolphin;
  final Color solitudeToBastille;
  final Color solitudeToWhite35;
  final Color solitudeToSolitude14;
  final Color transparentToSolitude12;

  const ThemedColors(
      {required this.dividerColorToGrey,
      required this.solitudeToSolitude14,
      required this.transparentToSolitude12,
      required this.solitudeToWhite35,
      required this.solitudeToBastille,
      required this.whiteToDolphin,
      required this.veryLightGreyToEclipse,
      required this.whiteToWhiteOpacity20});

  @override
  ThemeExtension<ThemedColors> copyWith(
          {Color? whiteToWhiteOpacity20,
          Color? dividerColorToGrey,
          Color? solitudeToSolitude14,
          Color? veryLightGreyToEclipse,
          Color? whiteToDolphin,
          Color? solitudeToBastille,
          Color? transparentToSolitude12,
          Color? solitudeToWhite35}) =>
      ThemedColors(
          dividerColorToGrey: dividerColorToGrey ?? this.dividerColorToGrey,
          transparentToSolitude12:
              transparentToSolitude12 ?? this.transparentToSolitude12,
          solitudeToSolitude14:
              solitudeToSolitude14 ?? this.solitudeToSolitude14,
          solitudeToWhite35: solitudeToWhite35 ?? this.solitudeToWhite35,
          whiteToDolphin: whiteToDolphin ?? this.whiteToDolphin,
          solitudeToBastille: solitudeToBastille ?? this.solitudeToBastille,
          whiteToWhiteOpacity20:
              whiteToWhiteOpacity20 ?? this.whiteToWhiteOpacity20,
          veryLightGreyToEclipse:
              veryLightGreyToEclipse ?? this.veryLightGreyToEclipse);

  @override
  ThemeExtension<ThemedColors> lerp(
      ThemeExtension<ThemedColors>? other, double t) {
    if (other is! ThemedColors) {
      return this;
    }
    return ThemedColors(
        solitudeToSolitude14:
            Color.lerp(solitudeToSolitude14, other.solitudeToSolitude14, t) ??
                solitudeToSolitude14,
        solitudeToWhite35: Color.lerp(solitudeToWhite35, other.solitudeToWhite35, t) ??
            solitudeToWhite35,
        transparentToSolitude12:
            Color.lerp(transparentToSolitude12, other.transparentToSolitude12, t) ??
                transparentToSolitude12,
        solitudeToBastille:
            Color.lerp(solitudeToBastille, other.solitudeToBastille, t) ??
                solitudeToBastille,
        whiteToDolphin: Color.lerp(whiteToDolphin, other.whiteToDolphin, t) ??
            whiteToDolphin,
        dividerColorToGrey:
            Color.lerp(dividerColorToGrey, other.dividerColorToGrey, t) ??
                dividerColorToGrey,
        veryLightGreyToEclipse:
            Color.lerp(veryLightGreyToEclipse, other.veryLightGreyToEclipse, t) ??
                veryLightGreyToEclipse,
        whiteToWhiteOpacity20:
            Color.lerp(whiteToWhiteOpacity20, other.whiteToWhiteOpacity20, t) ??
                whiteToWhiteOpacity20);
  }
}
