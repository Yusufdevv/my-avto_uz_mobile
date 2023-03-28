import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/dark.dart';
import 'package:auto/assets/constants/dark.dart';
import 'package:auto/assets/themes/theme_extensions/checkbox_style.dart';
import 'package:auto/assets/themes/theme_extensions/themed_brightness.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
abstract class DarkTheme {
  /// More info for color schema: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  /// More info for theme: https://docs.flutter.dev/cookbook/design/themes

  static ThemeData theme() => ThemeData(
        fontFamily: 'Averta CY',
        scaffoldBackgroundColor: DarkThemeColors.scaffoldBackground,
        indicatorColor: DarkThemeColors.navBarIndicator,
        dividerColor: DarkThemeColors.divider,
        hintColor: DarkThemeColors.hintColor,
        unselectedWidgetColor: grey,
        colorScheme: const ColorScheme(
          background: DarkThemeColors.surface,
          brightness: Brightness.light,
          primary: DarkThemeColors.primaryColor,
          secondary: DarkThemeColors.surface,
          error: DarkThemeColors.surface,
          surface: DarkThemeColors.surface,
          onPrimary: DarkThemeColors.surface,
          onSecondary: DarkThemeColors.surface,
          onBackground: DarkThemeColors.surface,
          onError: DarkThemeColors.surface,
          onSurface: DarkThemeColors.solitudeToGhost,
        ),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: DarkThemeColors.appBarColor,
          actionsIconTheme: CupertinoIconThemeData(
            color: DarkThemeColors.appBarActionIcon,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: DarkThemeColors.navBarBackground,
          selectedItemColor: DarkThemeColors.navBarSelected,
          unselectedItemColor: DarkThemeColors.navBarUnselected,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: DarkThemeColors.buttonColor,
          disabledColor: DarkThemeColors.buttonDisabledColor,
        ),
        textTheme: const TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
        ),
        extensions: const {
          CheckBoxStyle(
            unselectedBackgroundColor: DarkThemeColors.lightGreyToEclipse,
            unselectedBorderColor: DarkThemeColors.warmerGreyToDarkGray,
            unselectedItemColor: DarkThemeColors.navBarUnselected,
            unselectedBackgroundColor1: DarkThemeColors.whiteToEclipse,
          ),
          ThemedColors(
            dolphinToWhite: DarkThemeColors.dolphinToWhite,
            dolphinToGhost: DarkThemeColors.dolphinToGhost,
            darkToGrey: DarkThemeColors.darkToGrey,
            greyContainer26: DarkThemeColors.greyContainer27,
            redContainer26: DarkThemeColors.redContainer27,
            greenContainer26: DarkThemeColors.greenContainer27,
            blueContainer26: DarkThemeColors.blueContainer27,
            greyToDarkRider: DarkThemeColors.greyToDarkRider,
            solitudeToBastille: DarkThemeColors.solitudeToBastille,
            darkGreyToWhite: DarkThemeColors.darkGreyToWhite,
            blackToWhite80: DarkThemeColors.blackToWhite80,
            prussianBlueToWhite80: DarkThemeColors.prussianBlueToWhite80,
            transparentToSolitude12: DarkThemeColors.transparentToSolitude12,
            solitudeToDarkGray95: DarkThemeColors.solitudeToDarkGray95,
            dodgerBlueToWhite80: DarkThemeColors.dodgerBlueToWhite80,
            solitudeToWhite35: DarkThemeColors.solitudeToWhite35,
            solitudeToSolitude14: DarkThemeColors.solitudeToSolitude14,
            tangerineYellowToMediumSlateBlue:
                DarkThemeColors.tangerineYellowToMediumSlateBlue,
            darkToWhite: DarkThemeColors.darkToWhite,
            dividerColorToGrey: DarkThemeColors.dividerColorToGrey,
            whiteToDolphin: DarkThemeColors.whiteToDolphin,
            solitudeToCharcoal: DarkThemeColors.solitudeToCharcoal,
            whiteToWhiteOpacity20: DarkThemeColors.whiteToWhiteOpacity20,
            veryLightGreyToEclipse: DarkThemeColors.veryLightGreyToEclipse,
            whiteToNero1: DarkThemeColors.whiteToNero1,
            borderGreyToDark: DarkThemeColors.borderGreyToDark,
            iconPearlToWhite: DarkThemeColors.iconPearlToWhite,
            whiteToDarkRider: DarkThemeColors.whiteToDarkRider,
            borderGreyToGreen: DarkThemeColors.borderGreyToGreen,
            lightGreenToDarkGreen: DarkThemeColors.lightGreenToDarkGreen,
            blackToWhite: DarkThemeColors.blackToWhite,
            darkToPurple: DarkThemeColors.darkToPurple,
            lavenderToUltramarine30: DarkThemeColors.lavenderToUltramarine30,
            silver50ToNightRider: DarkThemeColors.silver50ToNightRider,
            whiteSmokeToBlack: DarkThemeColors.whiteSmokeToBlack,
            whiteSmokeToEclipse: DarkThemeColors.whiteSmokeToEclipse,
            lavenderToMediumSlateBlue30:
                DarkThemeColors.lavenderToMediumSlateBlue30,
            ghostWhiteToUltramarine10:
                DarkThemeColors.ghostWhiteToUltramarine10,
            aluminumToDolphin: DarkThemeColors.aluminumToDolphin,
            whiteSmokeToDark: DarkThemeColors.whiteSmokeToDark,
            transparentToNightRider: DarkThemeColors.transparentToNightRider,
            whiteToDark: DarkThemeColors.whiteToDark,
            solitudeBorderToSolitudeBorder10:
                DarkThemeColors.solitudeBorderToSolitudeBorder10,
            whiteToSecondNero: DarkThemeColors.whiteToSecondNero,
            solitudeToDarkRider: DarkThemeColors.solitudeToDarkRider,
            whiteLilacToWhiteLilac10: DarkThemeColors.whiteLilacToWhiteLilac3,
            snowToNightRider: DarkThemeColors.snowToNightRider,
            greySuitToWhite60: DarkThemeColors.greySuitToWhite60,
            ghostToGreySuit: DarkThemeColors.ghostToGreySuit,
            mediumSlateBlue50ToNightRider:
                DarkThemeColors.mediumSlateBlue50ToNightRider,
            stormGrey16ToStormGrey32: DarkThemeColors.stormGrey16ToStormGrey32,
            midnightExpressToDolphin: DarkThemeColors.midnightExpressToDolphin,
            ghostToEclipse: DarkThemeColors.ghostToEclipse,
            mediumSlateBlueToWhite: DarkThemeColors.mediumSlateBlueToWhite,
            solitudeToDolphin8: DarkThemeColors.solitudeToDolphin8,
            whiteSmoke2ToNightRider: DarkThemeColors.whiteSmoke2ToNightRider,
            dolphinToWhite60: DarkThemeColors.dolphinToWhite60,
            lightSlateBlue12ToLightSlateBlue:
                DarkThemeColors.lightSlateBlue12ToLightSlateBlue,
            solitudeToPayneGrey: DarkThemeColors.solitudeToPayneGrey,
            stormGrey12ToStormGrey24: DarkThemeColors.stormGrey12ToStormGrey24,
            snowToNero: DarkThemeColors.snowToNero,
            dolphinToGreySuit: DarkThemeColors.dolphinToGreySuit,
            dividerColorToWhiteOpacity:
                DarkThemeColors.dividerColorToWhiteOpacity,
            solitudeToNero: DarkThemeColors.solitudeToNero,
            whiteToSmoky: DarkThemeColors.whiteToSmoky,
            cinnabar12ToCinnabar: DarkThemeColors.cinnabar12ToCinnabar,
            whiteLilacToWhite4: DarkThemeColors.whiteLilacToWhite4,
            solitudeToEclipse: DarkThemeColors.solitudeToEclipse,
            ghostWhite1ToNero: DarkThemeColors.ghostWhite1ToNero,
            lavenderBlueToCharcoal: DarkThemeColors.lavenderBlueToCharcoal,
            solitudeContainerToDark: DarkThemeColors.solitudeContainerToDark,
            solitudeContainerToNero1: DarkThemeColors.solitudeContainerToNero1,
            whiteSmoke78ToWhiteSmoke12:
                DarkThemeColors.whiteSmoke78ToWhiteSmoke12,
            whiteToGondola: DarkThemeColors.whiteToGondola,
            whiteToWhite8: DarkThemeColors.whiteToWhite8,
            solitudeToGondola: DarkThemeColors.solitudeToGondola,
            midnightExpressToWhite: DarkThemeColors.midnightExpressToWhite,
            solitudeToDolphinBorder: DarkThemeColors.solitudeToDolphinBorder,
            whiteSmokeToNightRider: DarkThemeColors.whiteSmokeToNightRider,
            whiteToNero: DarkThemeColors.whiteToNero,
            mediumSlateBlueToDolphin: DarkThemeColors.mediumSlateBlueToDolphin,
            gainsboroToBlack: DarkThemeColors.gainsboroToBlack,
            greySuitToWhite: DarkThemeColors.greySuitToWhite,
            solitude1ToNero: DarkThemeColors.solitude1ToNero,
            solitude2ToNightRider: DarkThemeColors.solitude2ToNightRider,
            snow1ToCocoaBrown: DarkThemeColors.snow1ToCocoaBrown,
            snowToBlack: DarkThemeColors.snowToBlack,
            whiteWithOpacity90ToNero: DarkThemeColors.whiteWithOpacity90ToNero,
            solitudeTo1Black: DarkThemeColors.solitude1ToBlack,
            whiteLilacToNightRider: DarkThemeColors.whiteLilacToNightRider,
            midnightExpressToGreySuit:
                DarkThemeColors.midnightExpressToGreySuit,
            solitude2ToNero: DarkThemeColors.solitude2ToNero,
            snowToNero1: DarkThemeColors.snowToNero1,
            whiteToNightRider: DarkThemeColors.whiteToNightRider,
            silverToNightRider: DarkThemeColors.silverToNightRider,
            whiteLilacToPayneGrey: DarkThemeColors.whiteLilacToPayneGrey,
            greyToCinnabar: DarkThemeColors.greyToCinnabar,
            ghostToGondola: DarkThemeColors.ghostToGondola,
            whiteToEclipse: DarkThemeColors.whiteToEclipse,
            solitudeContainerToBlack: DarkThemeColors.solitudeContainerToBlack,
            whiteToBlack: DarkThemeColors.whiteToBlack,
            solitudeToNightRider: DarkThemeColors.solitudeToNightRider,
            whiteToNero2: DarkThemeColors.whiteToNero2,
            seashellToCinnabar15: DarkThemeColors.seashellToCinnabar15,
            dividerColor: DarkThemeColors.dividerColor,
            fairPinkToIndianTan: DarkThemeColors.fairPinkToIndianTan,
            scaffoldBackground: DarkThemeColors.scaffoldBackground,
            tutuToRed: DarkThemeColors.tutuToRed,
            redToWhite: DarkThemeColors.redToWhite,
            divider: DarkThemeColors.divider,
          ),
          WTextFieldStyle(
            fillColor: DarkThemeColors.solitudeToNero,
            borderColor: DarkThemeColors.solitudeToDarkRider,
          ),
          ThemedIcons(
            imageUrl: DarkIcons.logo,
            check: DarkIcons.blueCheck,
            filterIcon: DarkIcons.filterIcon,
            autoUzLightDark: DarkIcons.autoUzLightDark,
            google: DarkIcons.google,
          ),
          ThemedBrightness(brightness: Brightness.light)
        },
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: DarkThemeColors.displayLarge,
    height: 1.3,
  );
  static const displayMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DarkThemeColors.displayMedium,
    height: 1.3,
  );
  static const displaySmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: DarkThemeColors.displaySmall,
  );
  static const headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.headlineMedium,
    height: 1.2,
  );
  static const headlineSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.headlineSmall,
    height: 1.33,
  );
  static const titleLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: DarkThemeColors.titleLarge,
  );
  static const bodyLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: DarkThemeColors.bodyLarge,
  );

  static const bodyMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.3,
    color: DarkThemeColors.bodyMedium,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.titleMedium,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.titleSmall,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DarkThemeColors.bodySmall,
  );

  static const labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DarkThemeColors.button,
  );
}
