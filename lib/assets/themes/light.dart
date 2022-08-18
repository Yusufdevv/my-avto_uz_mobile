import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/light.dart';
import 'package:auto/assets/themes/theme_extensions/checkbox_style.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
abstract class LightTheme {
  /// More info for color schema: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  /// More info for theme: https://docs.flutter.dev/cookbook/design/themes

  static ThemeData theme() => ThemeData(
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: LightThemeColors.scaffoldBackground,
        backgroundColor: LightThemeColors.backgroundColor,
        indicatorColor: LightThemeColors.navBarIndicator,
        dividerColor: LightThemeColors.divider,
        hintColor: LightThemeColors.hintColor,
        unselectedWidgetColor: grey,
        appBarTheme: const AppBarTheme(
          color: LightThemeColors.appBarColor,
          actionsIconTheme: CupertinoIconThemeData(
            color: LightThemeColors.appBarActionIcon,
          ),
        ),
        colorScheme: const ColorScheme(
          background: LightThemeColors.surface,
          brightness: Brightness.dark,
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.surface,
          error: LightThemeColors.surface,
          surface: LightThemeColors.surface,
          onPrimary: LightThemeColors.surface,
          onSecondary: LightThemeColors.surface,
          onBackground: LightThemeColors.surface,
          onError: LightThemeColors.surface,
          onSurface: LightThemeColors.solitudeToGhost,
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
            unselectedBackgroundColor: LightThemeColors.lightGreyToEclipse,
            unselectedBorderColor: LightThemeColors.warmerGreyToDarkGray,
            unselectedItemColor: LightThemeColors.navBarUnselected,
            unselectedBackgroundColor1: LightThemeColors.whiteToEclipse,
          ),
          ThemedColors(
            dividerColorToGrey: LightThemeColors.dividerColorToGrey,
            darkToWhite: LightThemeColors.darkToWhite,
            prussianBlueToWhite80: LightThemeColors.prussianBlueToWhite80,
            stormGrey12ToStormGrey24: LightThemeColors.stormGrey12ToStormGrey24,
            dodgerBlueToWhite80: LightThemeColors.dodgerBlueToWhite80,
            blackToWhite: LightThemeColors.blackToWhite,
            blackToWhite80: LightThemeColors.blackToWhite80,
            solitudeToCharcoal: LightThemeColors.solitudeToCharcoal,
            solitudeToDolphin8: LightThemeColors.solitudeToDolphin8,
            dolphinToWhite60: LightThemeColors.dolphinToWhite60,
            whiteSmokeToEclipse: LightThemeColors.whiteSmokeToEclipse,
            lavenderToUltramarine30: LightThemeColors.lavenderToUltramarine30,
            solitudeToDarkGray95: LightThemeColors.solitudeToDarkGray95,
            whiteToWhiteOpacity20: LightThemeColors.whiteToWhiteOpacity20,
            veryLightGreyToEclipse: LightThemeColors.veryLightGreyToEclipse,
            transparentToSolitude12: LightThemeColors.transparentToSolitude12,
            whiteToDolphin: LightThemeColors.whiteToDolphin,
            greySuitToWhite60: LightThemeColors.greySuitToWhite60,
            dividerColorToWhiteOpacity:
                LightThemeColors.dividerColorToWhiteOpacity,
            dolphinToGreySuit: LightThemeColors.dolphinToGreySuit,
            whiteLilacToWhite4: LightThemeColors.whiteLilacToWhite4,
            solitudeContainerToDark: LightThemeColors.solitudeContainerToDark,
            aluminumToDolphin: LightThemeColors.aluminumToDolphin,
            whiteSmokeToDark: LightThemeColors.whiteSmokeToDark,
            silver50ToNightRider: LightThemeColors.silver50ToNightRider,
            whiteSmokeToBlack: LightThemeColors.whiteSmokeToBlack,
            whiteToGondola: LightThemeColors.whiteToGondola,
            whiteLilacToWhiteLilac10: LightThemeColors.whiteLilacToWhiteLilac10,
            solitudeBorderToSolitudeBorder10:
                LightThemeColors.solitudeBorderToSolitudeBorder10,
            lightSlateBlue12ToLightSlateBlue:
                LightThemeColors.lightSlateBlue12ToLightSlateBlue,
            mediumSlateBlueToWhite: LightThemeColors.mediumSlateBlueToWhite,
            midnightExpressToDolphin: LightThemeColors.midnightExpressToDolphin,
            cinnabar12ToCinnabar: LightThemeColors.cinnabar12ToCinnabar,
            transparentToNightRider: LightThemeColors.transparentToNightRider,
            darkToGrey: LightThemeColors.darkToGrey,
            ghostWhite1ToNero: LightThemeColors.ghostWhite1ToNero,
            lavenderBlueToCharcoal: LightThemeColors.lavenderBlueToCharcoal,
            ghostToGreySuit: LightThemeColors.ghostToGreySuit,
            greyContainer26: LightThemeColors.greyContainer26,
            redContainer26: LightThemeColors.redContainer26,
            greenContainer26: LightThemeColors.greenContainer26,
            blueContainer26: LightThemeColors.blueContainer26,
            borderGreyToDark: LightThemeColors.borderGreyToDark,
            darkGreyToWhite: LightThemeColors.darkGreyToWhite,
            whiteToNero1: LightThemeColors.whiteToNero1,
            solitudeToBastille: LightThemeColors.solitudeToBastille,
            solitudeToSolitude14: LightThemeColors.solitudeToSolitude14,
            solitudeToWhite35: LightThemeColors.solitudeToWhite35,
            iconPearlToWhite: LightThemeColors.iconPearlToWhite,
            whiteToDarkRider: LightThemeColors.whiteToDarkRider,
            borderGreyToGreen: LightThemeColors.borderGreyToGreen,
            lightGreenToDarkGreen: LightThemeColors.lightGreenToDarkGreen,
            greyToDarkRider: LightThemeColors.greyToDarkRider,
            darkToPurple: LightThemeColors.darkToPurple,
            solitudeToGondola: LightThemeColors.solitudeToGondola,
            solitudeToPayneGrey: LightThemeColors.solitudeToPayneGrey,
            solitudeToNero: LightThemeColors.solitudeToNero,
            solitudeToEclipse: LightThemeColors.solitudeToEclipse,
            snow1ToCocoaBrown: LightThemeColors.snow1ToCocoaBrown,
            mediumSlateBlue50ToNightRider:
                LightThemeColors.mediumSlateBlue50ToNightRider,
            stormGrey16ToStormGrey32: LightThemeColors.stormGrey16ToStormGrey32,
            ghostWhiteToUltramarine10:
                LightThemeColors.ghostWhiteToUltramarine10,
            snowToNero: LightThemeColors.snowToNero,
            solitudeToDarkRider: LightThemeColors.solitudeToDarkRider,
            whiteToDark: LightThemeColors.whiteToDark,
            ghostToEclipse: LightThemeColors.ghostToEclipse,
            snowToNightRider: LightThemeColors.snowToNightRider,
            whiteToSmoky: LightThemeColors.whiteToSmoky,
            whiteToSecondNero: LightThemeColors.whiteToSecondNero,
            whiteToWhite8: LightThemeColors.whiteToWhite8,
            whiteSmokeToNightRider: LightThemeColors.whiteSmokeToNightRider,
            whiteToNero: LightThemeColors.whiteToNero,
            mediumSlateBlueToDolphin: LightThemeColors.mediumSlateBlueToDolphin,
            gainsboroToBlack: LightThemeColors.gainsboroToBlack,
            greySuitToWhite: LightThemeColors.greySuitToWhite,
            midnightExpressToWhite: LightThemeColors.midnightExpressToWhite,
            solitude1ToNero: LightThemeColors.solitude1ToNero,
            solitude2ToNero: LightThemeColors.solitude2ToNero,
            solitude2ToNightRider: LightThemeColors.solitude2ToNightRider,
            snowToBlack: LightThemeColors.snowToBlack,
            whiteWithOpacity90ToNero: LightThemeColors.whiteWithOpacity90ToNero,
            whiteSmoke2ToNightRider: LightThemeColors.whiteSmoke2ToNightRider,
            solitudeTo1Black: LightThemeColors.solitudeTo1Black,
            whiteLilacToNightRider: LightThemeColors.whiteLilacToNightRider,
            midnightExpressToGreySuit:
                LightThemeColors.midnightExpressToGreySuit,
            snowToNero1: LightThemeColors.snowToNero1,
            whiteToNightRider: LightThemeColors.whiteToNightRider,
            whiteToEclipse: LightThemeColors.whiteToEclipse,
            whiteLilacToPayneGrey: LightThemeColors.whiteLilacToPayneGrey,
            whiteSmoke78ToWhiteSmoke12:
                LightThemeColors.whiteSmoke78ToWhiteSmoke12,
            lavenderToMediumSlateBlue30:
                LightThemeColors.lavenderToMediumSlateBlue30,
            solitudeToDolphinBorder: LightThemeColors.solitudeToDolphinBorder,
            greyToCinnabar: LightThemeColors.greyToCinnabar,
            ghostToGondola: LightThemeColors.ghostToGondola,
            silverToNightRider: LightThemeColors.silverToNightRider,
            tangerineYellowToMediumSlateBlue:
                LightThemeColors.tangerineYellowToMediumSlateBlue,
            solitudeContainerToBlack: LightThemeColors.solitudeContainerToBlack,
            solitudeContainerToNero1: LightThemeColors.solitudeContainerToNero1,
          ),
          WTextFieldStyle(
            fillColor: LightThemeColors.solitudeToNero,
            borderColor: LightThemeColors.solitudeToDarkRider,
          ),
          ThemedIcons(
            imageUrl: LightIcons.logo,
            check: LightIcons.check,
            filterIcon: LightIcons.filterIcon,
          ),
        },
      );

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: LightThemeColors.headline1,
    height: 1.3,
  );
  static const headline2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: LightThemeColors.headline2,
    height: 1.3,
  );
  static const headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.headline3,
  );
  static const headline4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: LightThemeColors.headline4,
    height: 1.2,
  );
  static const headline5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: LightThemeColors.headline5,
    height: 1.33,
  );
  static const headline6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: LightThemeColors.headline6,
  );
  static const bodyText1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: LightThemeColors.bodyText1,
  );

  static const bodyText2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.3,
    color: LightThemeColors.bodyText2,
  );

  static const subTitle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: LightThemeColors.subTitle1,
  );

  static const subTitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: LightThemeColors.subTitle2,
  );

  static const caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.caption,
  );

  static const button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.button,
  );
}
