import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/dark.dart';
import 'package:auto/assets/constants/dark.dart';
import 'package:auto/assets/themes/theme_extensions/checkbox_style.dart';
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
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: DarkThemeColors.scaffoldBackground,
        indicatorColor: DarkThemeColors.navBarIndicator,
        dividerColor: DarkThemeColors.divider,
        hintColor: DarkThemeColors.hintColor,
        unselectedWidgetColor: grey,
        colorScheme: const ColorScheme(
          background: DarkThemeColors.surface,
          brightness: Brightness.dark,
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
          headline1: headline1,
          headline2: headline2,
          headline3: headline3,
          headline4: headline4,
          headline5: headline5,
          headline6: headline6,
          bodyText1: bodyText1,
          bodyText2: bodyText2,
          subtitle1: subTitle1,
          subtitle2: subTitle2,
          caption: caption,
          button: button,
        ),
        extensions: const {
          CheckBoxStyle(
            unselectedBackgroundColor: DarkThemeColors.lightGreyToEclipse,
            unselectedBorderColor: DarkThemeColors.warmerGreyToDarkGray,
            unselectedItemColor: DarkThemeColors.navBarUnselected,
            unselectedBackgroundColor1: DarkThemeColors.whiteToEclipse,
          ),
          ThemedColors(
            seashellToCinnabar15: DarkThemeColors.seashellToCinnabar15,
            darkToGrey: DarkThemeColors.darkToGrey,
            greyContainer26: DarkThemeColors.greyContainer26,
            redContainer26: DarkThemeColors.redContainer26,
            greenContainer26: DarkThemeColors.greenContainer26,
            blueContainer26: DarkThemeColors.blueContainer26,
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
        },
      );

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: DarkThemeColors.headline1,
    height: 1.3,
  );
  static const headline2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DarkThemeColors.headline2,
    height: 1.3,
  );
  static const headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: DarkThemeColors.headline3,
  );
  static const headline4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.headline4,
    height: 1.2,
  );
  static const headline5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.headline5,
    height: 1.33,
  );
  static const headline6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: DarkThemeColors.headline6,
  );
  static const bodyText1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: DarkThemeColors.bodyText1,
  );

  static const bodyText2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.3,
    color: DarkThemeColors.bodyText2,
  );

  static const subTitle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.subTitle1,
  );

  static const subTitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: DarkThemeColors.subTitle2,
  );

  static const caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DarkThemeColors.caption,
  );

  static const button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: DarkThemeColors.button,
  );
}
