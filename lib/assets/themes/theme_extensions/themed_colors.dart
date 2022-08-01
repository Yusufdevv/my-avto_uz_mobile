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
  final Color darkToWhite;
  final Color solitudeToDarkGray95;
  final Color blackToWhite80;
  final Color dodgerBlueToWhite80;
  final Color prussianBlueToWhite80;
  final Color solitudeToCharcoal;
  final Color darkGreyToWhite;

  const ThemedColors(
      {required this.dividerColorToGrey,
      required this.solitudeToSolitude14,
      required this.prussianBlueToWhite80,
      required this.blackToWhite80,
      required this.solitudeToCharcoal,
      required this.dodgerBlueToWhite80,
      required this.solitudeToDarkGray95,
      required this.darkToWhite,
      required this.transparentToSolitude12,
      required this.solitudeToWhite35,
      required this.solitudeToBastille,
      required this.whiteToDolphin,
      required this.darkGreyToWhite,
      required this.veryLightGreyToEclipse,
      required this.whiteToWhiteOpacity20});

  @override
  ThemeExtension<ThemedColors> copyWith(
          {Color? whiteToWhiteOpacity20,
          Color? dividerColorToGrey,
          Color? darkToWhite,
          Color? dodgerBlueToWhite80,
          Color? prussianBlueToWhite80,
          Color? solitudeToSolitude14,
          Color? solitudeToCharcoal,
          Color? darkGreyToWhite,
          Color? veryLightGreyToEclipse,
          Color? whiteToDolphin,
          Color? solitudeToBastille,
          Color? solitudeToDarkGray95,
          Color? blackToWhite80,
          Color? transparentToSolitude12,
          Color? solitudeToWhite35}) =>
      ThemedColors(
          dividerColorToGrey: dividerColorToGrey ?? this.dividerColorToGrey,
          solitudeToCharcoal: solitudeToCharcoal ?? this.solitudeToCharcoal,
          darkGreyToWhite: darkGreyToWhite ?? this.darkGreyToWhite,
          prussianBlueToWhite80:
              prussianBlueToWhite80 ?? this.prussianBlueToWhite80,
          blackToWhite80: blackToWhite80 ?? this.blackToWhite80,
          dodgerBlueToWhite80: dodgerBlueToWhite80 ?? this.dodgerBlueToWhite80,
          solitudeToDarkGray95:
              solitudeToDarkGray95 ?? this.solitudeToDarkGray95,
          darkToWhite: darkToWhite ?? this.darkToWhite,
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
        prussianBlueToWhite80:
            Color.lerp(prussianBlueToWhite80, other.prussianBlueToWhite80, t) ??
                prussianBlueToWhite80,
        blackToWhite80: Color.lerp(blackToWhite80, other.blackToWhite80, t) ??
            blackToWhite80,
        solitudeToCharcoal: Color.lerp(solitudeToCharcoal, other.solitudeToCharcoal, t) ??
            solitudeToCharcoal,
        dodgerBlueToWhite80:
            Color.lerp(dodgerBlueToWhite80, other.dodgerBlueToWhite80, t) ??
                dodgerBlueToWhite80,
        solitudeToDarkGray95:
            Color.lerp(solitudeToDarkGray95, other.solitudeToDarkGray95, t) ??
                solitudeToDarkGray95,
        darkToWhite:
            Color.lerp(darkToWhite, other.darkToWhite, t) ?? darkToWhite,
        solitudeToWhite35: Color.lerp(solitudeToWhite35, other.solitudeToWhite35, t) ??
            solitudeToWhite35,
        transparentToSolitude12:
            Color.lerp(transparentToSolitude12, other.transparentToSolitude12, t) ??
                transparentToSolitude12,
        solitudeToBastille:
            Color.lerp(solitudeToBastille, other.solitudeToBastille, t) ?? solitudeToBastille,
        whiteToDolphin: Color.lerp(whiteToDolphin, other.whiteToDolphin, t) ?? whiteToDolphin,
        dividerColorToGrey: Color.lerp(dividerColorToGrey, other.dividerColorToGrey, t) ?? dividerColorToGrey,
        veryLightGreyToEclipse: Color.lerp(veryLightGreyToEclipse, other.veryLightGreyToEclipse, t) ?? veryLightGreyToEclipse,
        whiteToWhiteOpacity20: Color.lerp(whiteToWhiteOpacity20, other.whiteToWhiteOpacity20, t) ?? whiteToWhiteOpacity20,
        darkGreyToWhite: Color.lerp(darkGreyToWhite, other.darkGreyToWhite, t) ?? darkGreyToWhite);
  }
}
