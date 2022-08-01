import 'package:flutter/material.dart';

class ThemedColors extends ThemeExtension<ThemedColors> {
  final Color whiteToWhiteOpacity20;
  final Color dividerColorToGrey;
  final Color blackToWhite;
  final Color veryLightGreyToEclipse;
  final Color whiteToDolphin;
  final Color solitudeToBastille;
  final Color solitudeToWhite35;
  final Color solitudeToSolitude14;
  final Color whiteToSmoky;
  final Color transparentToSolitude12;
  final Color darkToWhite;
  final Color stormGrey12ToStormGrey24;
  final Color solitudeToDarkGray95;
  final Color whiteToGondola;
  final Color midnightExpressToDolphin;
  final Color lavenderToUltramarine30;
  final Color blackToWhite80;
  final Color snowToNero;
  final Color solitudeToEclipse;
  final Color whiteSmokeToEclipse;
  final Color dodgerBlueToWhite80;
  final Color aluminumToDolphin;
  final Color lavenderToMediumSlateBlue30;
  final Color midnightExpressToWhite;
  final Color solitudeToNero;
  final Color stormGrey16ToStormGrey32;
  final Color ghostWhiteToUltramarine10;
  final Color mediumSlateBlue50ToNightRider;
  final Color solitudeToDarkRider;
  final Color solitudeContainerToDark;
  final Color prussianBlueToWhite80;
  final Color transparentToNightRider;
  final Color whiteToDark;
  final Color ghostToEclipse;
  final Color whiteSmokeToDark;
  final Color snowToNightRider;
  final Color solitudeToCharcoal;

  const ThemedColors(
      {required this.dividerColorToGrey,
      required this.solitudeToSolitude14,
      required this.stormGrey12ToStormGrey24,
      required this.lavenderToMediumSlateBlue30,
      required this.ghostToEclipse,
      required this.transparentToNightRider,
      required this.stormGrey16ToStormGrey32,
      required this.midnightExpressToWhite,
      required this.solitudeToNero,
      required this.whiteSmokeToDark,
      required this.mediumSlateBlue50ToNightRider,
      required this.solitudeContainerToDark,
      required this.lavenderToUltramarine30,
      required this.solitudeToDarkRider,
      required this.prussianBlueToWhite80,
      required this.whiteToDark,
      required this.whiteToSmoky,
      required this.whiteToGondola,
      required this.snowToNightRider,
      required this.aluminumToDolphin,
      required this.whiteSmokeToEclipse,
      required this.blackToWhite80,
      required this.ghostWhiteToUltramarine10,
      required this.solitudeToCharcoal,
      required this.dodgerBlueToWhite80,
      required this.solitudeToDarkGray95,
      required this.darkToWhite,
      required this.transparentToSolitude12,
      required this.solitudeToWhite35,
      required this.solitudeToBastille,
      required this.whiteToDolphin,
      required this.solitudeToEclipse,
      required this.snowToNero,
      required this.midnightExpressToDolphin,
      required this.blackToWhite,
      required this.veryLightGreyToEclipse,
      required this.whiteToWhiteOpacity20});

  @override
  ThemeExtension<ThemedColors> copyWith(
          {Color? whiteToWhiteOpacity20,
          Color? dividerColorToGrey,
          Color? stormGrey12ToStormGrey24,
          Color? darkToWhite,
          Color? midnightExpressToWhite,
          Color? midnightExpressToDolphin,
          Color? snowToNero,
          Color? whiteSmokeToDark,
          Color? ghostToEclipse,
          Color? dodgerBlueToWhite80,
          Color? stormGrey16ToStormGrey32,
          Color? blackToWhite,
          Color? mediumSlateBlue50ToNightRider,
          Color? whiteToSmoky,
          Color? transparentToNightRider,
          Color? solitudeContainerToDark,
          Color? solitudeToDarkRider,
          Color? solitudeToEclipse,
          Color? prussianBlueToWhite80,
          Color? solitudeToSolitude14,
          Color? lavenderToMediumSlateBlue30,
          Color? lavenderToUltramarine30,
          Color? solitudeToNero,
          Color? solitudeToCharcoal,
          Color? veryLightGreyToEclipse,
          Color? whiteToGondola,
          Color? whiteToDolphin,
          Color? ghostWhiteToUltramarine10,
          Color? aluminumToDolphin,
          Color? whiteToDark,
          Color? solitudeToBastille,
          Color? whiteSmokeToEclipse,
          Color? solitudeToDarkGray95,
          Color? snowToNightRider,
          Color? blackToWhite80,
          Color? transparentToSolitude12,
          Color? solitudeToWhite35}) =>
      ThemedColors(
          dividerColorToGrey: dividerColorToGrey ?? this.dividerColorToGrey,
          blackToWhite: blackToWhite ?? this.blackToWhite,
          aluminumToDolphin: aluminumToDolphin ?? this.aluminumToDolphin,
          solitudeToNero: solitudeToNero ?? this.solitudeToNero,
          ghostToEclipse: ghostToEclipse ?? this.ghostToEclipse,
          whiteToSmoky: whiteToSmoky ?? this.whiteToSmoky,
          solitudeToEclipse: solitudeToEclipse ?? this.solitudeToEclipse,
          snowToNero: snowToNero ?? this.snowToNero,
          stormGrey12ToStormGrey24:
              stormGrey12ToStormGrey24 ?? this.stormGrey12ToStormGrey24,
          whiteSmokeToEclipse: whiteSmokeToEclipse ?? this.whiteSmokeToEclipse,
          solitudeContainerToDark:
              solitudeContainerToDark ?? this.solitudeContainerToDark,
          lavenderToUltramarine30:
              lavenderToUltramarine30 ?? this.lavenderToUltramarine30,
          ghostWhiteToUltramarine10:
              ghostWhiteToUltramarine10 ?? this.ghostWhiteToUltramarine10,
          lavenderToMediumSlateBlue30:
              lavenderToMediumSlateBlue30 ?? this.lavenderToMediumSlateBlue30,
          stormGrey16ToStormGrey32:
              stormGrey16ToStormGrey32 ?? this.stormGrey16ToStormGrey32,
          transparentToNightRider:
              transparentToNightRider ?? this.transparentToNightRider,
          mediumSlateBlue50ToNightRider: mediumSlateBlue50ToNightRider ??
              this.mediumSlateBlue50ToNightRider,
          whiteSmokeToDark: whiteSmokeToDark ?? this.whiteSmokeToDark,
          solitudeToDarkRider: solitudeToDarkRider ?? this.solitudeToDarkRider,
          snowToNightRider: snowToNightRider ?? this.snowToNightRider,
          solitudeToCharcoal: solitudeToCharcoal ?? this.solitudeToCharcoal,
          whiteToDark: whiteToDark ?? this.whiteToDark,
          midnightExpressToWhite:
              midnightExpressToWhite ?? this.midnightExpressToWhite,
          prussianBlueToWhite80:
              prussianBlueToWhite80 ?? this.prussianBlueToWhite80,
          blackToWhite80: blackToWhite80 ?? this.blackToWhite80,
          dodgerBlueToWhite80: dodgerBlueToWhite80 ?? this.dodgerBlueToWhite80,
          solitudeToDarkGray95:
              solitudeToDarkGray95 ?? this.solitudeToDarkGray95,
          darkToWhite: darkToWhite ?? this.darkToWhite,
          whiteToGondola: whiteToGondola ?? this.whiteToGondola,
          transparentToSolitude12:
              transparentToSolitude12 ?? this.transparentToSolitude12,
          solitudeToSolitude14:
              solitudeToSolitude14 ?? this.solitudeToSolitude14,
          solitudeToWhite35: solitudeToWhite35 ?? this.solitudeToWhite35,
          whiteToDolphin: whiteToDolphin ?? this.whiteToDolphin,
          solitudeToBastille: solitudeToBastille ?? this.solitudeToBastille,
          whiteToWhiteOpacity20:
              whiteToWhiteOpacity20 ?? this.whiteToWhiteOpacity20,  midnightExpressToDolphin:
      midnightExpressToDolphin ?? this.midnightExpressToDolphin,
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
        whiteToSmoky:
            Color.lerp(whiteToSmoky, other.whiteToSmoky, t) ?? whiteToSmoky,
        blackToWhite:
            Color.lerp(blackToWhite, other.blackToWhite, t) ?? blackToWhite,
        solitudeToEclipse: Color.lerp(solitudeToEclipse, other.solitudeToEclipse, t) ??
            solitudeToEclipse,
        solitudeToNero: Color.lerp(solitudeToNero, other.solitudeToNero, t) ??
            solitudeToNero,
        ghostToEclipse: Color.lerp(ghostToEclipse, other.ghostToEclipse, t) ??
            ghostToEclipse,
        whiteToDark:
            Color.lerp(whiteToDark, other.whiteToDark, t) ?? whiteToDark,
        midnightExpressToWhite:
            Color.lerp(midnightExpressToWhite, other.midnightExpressToWhite, t) ??
                midnightExpressToWhite,
        prussianBlueToWhite80:
            Color.lerp(prussianBlueToWhite80, other.prussianBlueToWhite80, t) ??
                prussianBlueToWhite80,
        blackToWhite80: Color.lerp(blackToWhite80, other.blackToWhite80, t) ??
            blackToWhite80,
        solitudeToCharcoal:
            Color.lerp(solitudeToCharcoal, other.solitudeToCharcoal, t) ??
                solitudeToCharcoal,
        dodgerBlueToWhite80:
            Color.lerp(dodgerBlueToWhite80, other.dodgerBlueToWhite80, t) ??
                dodgerBlueToWhite80,
        solitudeToDarkGray95: Color.lerp(solitudeToDarkGray95, other.solitudeToDarkGray95, t) ?? solitudeToDarkGray95,
        darkToWhite: Color.lerp(darkToWhite, other.darkToWhite, t) ?? darkToWhite,
        stormGrey12ToStormGrey24: Color.lerp(stormGrey12ToStormGrey24, other.stormGrey12ToStormGrey24, t) ?? stormGrey12ToStormGrey24,
        solitudeToDarkRider: Color.lerp(solitudeToDarkRider, other.solitudeToDarkRider, t) ?? solitudeToDarkRider,
        stormGrey16ToStormGrey32: Color.lerp(stormGrey16ToStormGrey32, other.stormGrey16ToStormGrey32, t) ?? stormGrey16ToStormGrey32,
        snowToNero: Color.lerp(snowToNero, other.snowToNero, t) ?? snowToNero,
        transparentToNightRider: Color.lerp(transparentToNightRider, other.transparentToNightRider, t) ?? transparentToNightRider,
        whiteSmokeToDark: Color.lerp(whiteSmokeToDark, other.whiteSmokeToDark, t) ?? whiteSmokeToDark,
        aluminumToDolphin: Color.lerp(aluminumToDolphin, other.aluminumToDolphin, t) ?? aluminumToDolphin,
        lavenderToUltramarine30: Color.lerp(lavenderToUltramarine30, other.lavenderToUltramarine30, t) ?? lavenderToUltramarine30,
        mediumSlateBlue50ToNightRider: Color.lerp(mediumSlateBlue50ToNightRider, other.mediumSlateBlue50ToNightRider, t) ?? mediumSlateBlue50ToNightRider,
        solitudeToWhite35: Color.lerp(solitudeToWhite35, other.solitudeToWhite35, t) ?? solitudeToWhite35,
        transparentToSolitude12: Color.lerp(transparentToSolitude12, other.transparentToSolitude12, t) ?? transparentToSolitude12,
        solitudeToBastille: Color.lerp(solitudeToBastille, other.solitudeToBastille, t) ?? solitudeToBastille,
        whiteToDolphin: Color.lerp(whiteToDolphin, other.whiteToDolphin, t) ?? whiteToDolphin,
        whiteSmokeToEclipse: Color.lerp(whiteSmokeToEclipse, other.whiteSmokeToEclipse, t) ?? whiteSmokeToEclipse,
        lavenderToMediumSlateBlue30: Color.lerp(lavenderToMediumSlateBlue30, other.lavenderToMediumSlateBlue30, t) ?? lavenderToMediumSlateBlue30,
        snowToNightRider: Color.lerp(snowToNightRider, other.snowToNightRider, t) ?? snowToNightRider,
        solitudeContainerToDark: Color.lerp(solitudeContainerToDark, other.solitudeContainerToDark, t) ?? solitudeContainerToDark,
        dividerColorToGrey: Color.lerp(dividerColorToGrey, other.dividerColorToGrey, t) ?? dividerColorToGrey,
        ghostWhiteToUltramarine10: Color.lerp(ghostWhiteToUltramarine10, other.ghostWhiteToUltramarine10, t) ?? ghostWhiteToUltramarine10,
        midnightExpressToDolphin: Color.lerp(midnightExpressToDolphin, other.midnightExpressToDolphin, t) ?? midnightExpressToDolphin,
        veryLightGreyToEclipse: Color.lerp(veryLightGreyToEclipse, other.veryLightGreyToEclipse, t) ?? veryLightGreyToEclipse,
        whiteToGondola: Color.lerp(whiteToGondola, other.whiteToGondola, t) ?? whiteToGondola,
        whiteToWhiteOpacity20: Color.lerp(whiteToWhiteOpacity20, other.whiteToWhiteOpacity20, t) ?? whiteToWhiteOpacity20);
  }
}
