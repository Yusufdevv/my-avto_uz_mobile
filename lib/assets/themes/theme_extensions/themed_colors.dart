import 'package:flutter/material.dart';

class ThemedColors extends ThemeExtension<ThemedColors> {
  final Color whiteToWhiteOpacity20;
  final Color dividerColorToGrey;
  final Color whiteToSmoky;
  final Color whiteSmokeToNightRider;
  final Color whiteToNero;
  final Color mediumSlateBlueToDolphin;
  final Color whiteSmokeToEclipse;
  final Color solitudeToEclipse;
  final Color greySuitToWhite;
  final Color gainsboroToBlack;
  final Color midnightExpressToWhite;
  final Color solitude1ToNero;
  final Color solitude2ToNightRider;
  final Color snowToBlack;
  final Color whiteWithOpacity90ToNero;
  final Color whiteSmoke2ToNightRider;
  final Color solitudeTo1Black;
  final Color whiteLilacToNightRider;

  const ThemedColors({
    required this.dividerColorToGrey,
    required this.whiteToWhiteOpacity20,
    required this.whiteToSmoky,
    required this.whiteSmokeToNightRider,
    required this.whiteToNero,
    required this.mediumSlateBlueToDolphin,
    required this.whiteSmokeToEclipse,
    required this.solitudeToEclipse,
    required this.greySuitToWhite,
    required this.gainsboroToBlack,
    required this.midnightExpressToWhite,
    required this.solitude1ToNero,
    required this.solitude2ToNightRider,
    required this.snowToBlack,
    required this.whiteWithOpacity90ToNero,
    required this.whiteSmoke2ToNightRider,
    required this.solitudeTo1Black,
    required this.whiteLilacToNightRider,
  });

  @override
  ThemeExtension<ThemedColors> copyWith({
    Color? whiteToWhiteOpacity20,
    Color? dividerColorToGrey,
    Color? whiteToSmoky,
    Color? whiteSmokeToNightRider,
    Color? whiteToNero,
    Color? mediumSlateBlueToDolphin,
    Color? whiteSmokeToEclipse,
    Color? solitudeToEclipse,
    Color? gainsboroToBlack,
    Color? greySuitToWhite,
    Color? midnightExpressToWhite,
    Color? solitude1ToNero,
    Color? solitude2ToNightRider,
    Color? snowToBlack,
    Color? whiteWithOpacity90ToNero,
    Color? whiteSmoke2ToNightRider,
    Color? solitude1ToBlack,
    Color? whiteLilacToNightRider,
  }) =>
      ThemedColors(
          dividerColorToGrey: dividerColorToGrey ?? this.dividerColorToGrey,
          whiteToWhiteOpacity20:
              whiteToWhiteOpacity20 ?? this.whiteToWhiteOpacity20,
          whiteToSmoky: whiteToSmoky ?? this.whiteToSmoky,
          whiteSmokeToNightRider:
              whiteSmokeToNightRider ?? this.whiteSmokeToNightRider,
          whiteToNero: whiteToNero ?? this.whiteToNero,
          mediumSlateBlueToDolphin:
              mediumSlateBlueToDolphin ?? this.mediumSlateBlueToDolphin,
          whiteSmokeToEclipse: whiteSmokeToEclipse ?? this.whiteSmokeToEclipse,
          solitudeToEclipse: solitudeToEclipse ?? this.solitudeToEclipse,
          gainsboroToBlack: gainsboroToBlack ?? this.gainsboroToBlack,
          greySuitToWhite: greySuitToWhite ?? this.greySuitToWhite,
          midnightExpressToWhite:
              midnightExpressToWhite ?? this.midnightExpressToWhite,
          solitude1ToNero: solitude1ToNero ?? this.solitude1ToNero,
          solitude2ToNightRider:
              solitude2ToNightRider ?? this.solitude2ToNightRider,
          snowToBlack: snowToBlack ?? this.snowToBlack,
          whiteWithOpacity90ToNero:
              whiteWithOpacity90ToNero ?? this.whiteWithOpacity90ToNero,
          whiteSmoke2ToNightRider:
              whiteSmoke2ToNightRider ?? this.whiteSmoke2ToNightRider,
          solitudeTo1Black: solitude1ToBlack ?? this.solitudeTo1Black,
          whiteLilacToNightRider:
              whiteLilacToNightRider ?? this.whiteLilacToNightRider);

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
              whiteToWhiteOpacity20,
      whiteToSmoky:
          Color.lerp(whiteToSmoky, other.whiteToSmoky, t) ?? whiteToSmoky,
      whiteSmokeToNightRider:
          Color.lerp(whiteSmokeToNightRider, other.whiteSmokeToNightRider, t) ??
              whiteSmokeToNightRider,
      whiteToNero: Color.lerp(whiteToNero, other.whiteToNero, t) ?? whiteToNero,
      mediumSlateBlueToDolphin: Color.lerp(
              mediumSlateBlueToDolphin, other.mediumSlateBlueToDolphin, t) ??
          mediumSlateBlueToDolphin,
      whiteSmokeToEclipse:
          Color.lerp(whiteSmokeToEclipse, other.whiteSmokeToEclipse, t) ??
              whiteSmokeToEclipse,
      solitudeToEclipse:
          Color.lerp(solitudeToEclipse, other.solitudeToEclipse, t) ??
              solitudeToEclipse,
      gainsboroToBlack:
          Color.lerp(gainsboroToBlack, other.gainsboroToBlack, t) ??
              gainsboroToBlack,
      greySuitToWhite: Color.lerp(greySuitToWhite, other.greySuitToWhite, t) ??
          greySuitToWhite,
      midnightExpressToWhite:
          Color.lerp(midnightExpressToWhite, other.midnightExpressToWhite, t) ??
              midnightExpressToWhite,
      solitude1ToNero: Color.lerp(solitude1ToNero, other.solitude1ToNero, t) ??
          solitude1ToNero,
      solitude2ToNightRider:
          Color.lerp(solitude2ToNightRider, other.solitude2ToNightRider, t) ??
              solitude2ToNightRider,
      snowToBlack: Color.lerp(snowToBlack, other.snowToBlack, t) ?? snowToBlack,
      whiteWithOpacity90ToNero: Color.lerp(
              whiteWithOpacity90ToNero, other.whiteWithOpacity90ToNero, t) ??
          whiteWithOpacity90ToNero,
      whiteSmoke2ToNightRider: Color.lerp(
              whiteSmoke2ToNightRider, other.whiteSmoke2ToNightRider, t) ??
          whiteSmoke2ToNightRider,
      solitudeTo1Black:
          Color.lerp(solitudeTo1Black, other.solitudeTo1Black, t) ??
              solitudeTo1Black,
      whiteLilacToNightRider:
          Color.lerp(whiteLilacToNightRider, other.whiteLilacToNightRider, t) ??
              whiteLilacToNightRider,
    );
  }
}
