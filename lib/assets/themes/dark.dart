import 'package:auto/assets/colors/dark.dart';
import 'package:auto/assets/themes/theme_extensions/checkbox_style.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
        colorScheme: const ColorScheme(
          background: DarkThemeColors.surface,
          brightness: Brightness.dark,
          primary: DarkThemeColors.navBarIndicator,
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
          ),
          ThemedColors(
              solitudeToBastille: DarkThemeColors.solitudeToBastille,
              blackToWhite80: DarkThemeColors.blackToWhite80,
              lavenderToUltramarine30: DarkThemeColors.lavenderToUltramarine30,
              prussianBlueToWhite80: DarkThemeColors.prussianBlueToWhite80,
              transparentToSolitude12: DarkThemeColors.transparentToSolitude12,
              whiteSmokeToEclipse: DarkThemeColors.whiteSmokeToEclipse,
              lavenderToMediumSlateBlue30: DarkThemeColors.lavenderToMediumSlateBlue30,
              ghostWhiteToUltramarine10: DarkThemeColors.ghostWhiteToUltramarine10,
              solitudeToDarkGray95: DarkThemeColors.solitudeToDarkGray95,
              aluminumToDolphin: DarkThemeColors.aluminumToDolphin,
              whiteSmokeToDark: DarkThemeColors.whiteSmokeToDark,
              transparentToNightRider: DarkThemeColors.transparentToNightRider,
              dodgerBlueToWhite80: DarkThemeColors.dodgerBlueToWhite80,
              solitudeToWhite35: DarkThemeColors.solitudeToWhite35,
              solitudeToSolitude14: DarkThemeColors.solitudeToSolitude14,
              whiteToDark: DarkThemeColors.whiteToDark,
              solitudeToDarkRider: DarkThemeColors.solitudeToDarkRider,
              snowToNightRider: DarkThemeColors.snowToNightRider,
              mediumSlateBlue50ToNightRider: DarkThemeColors.mediumSlateBlue50ToNightRider,
              stormGrey16ToStormGrey32: DarkThemeColors.stormGrey16ToStormGrey32,
              darkToWhite: DarkThemeColors.darkToWhite,
              midnightExpressToDolphin: DarkThemeColors.midnightExpressToDolphin,
              ghostToEclipse: DarkThemeColors.ghostToEclipse,
              blackToWhite: DarkThemeColors.blackToWhite,
              stormGrey12ToStormGrey24: DarkThemeColors.stormGrey12ToStormGrey24,
              snowToNero: DarkThemeColors.snowToNero,
              solitudeToNero: DarkThemeColors.solitudeToNero,
              whiteToSmoky: DarkThemeColors.whiteToSmoky,
              solitudeToEclipse: DarkThemeColors.solitudeToEclipse,
              dividerColorToGrey: DarkThemeColors.dividerColorToGrey,
              whiteToDolphin: DarkThemeColors.whiteToDolphin,
              solitudeToCharcoal: DarkThemeColors.solitudeToCharcoal,
              whiteToWhiteOpacity20: DarkThemeColors.whiteToWhiteOpacity20,
              veryLightGreyToEclipse: DarkThemeColors.veryLightGreyToEclipse),
              solitudeContainerToDark: DarkThemeColors.solitudeContainerToDark,
              whiteToGondola: DarkThemeColors.whiteToGondola,
              midnightExpressToWhite: DarkThemeColors.midnightExpressToWhite,
              whiteToWhiteOpacity20: DarkThemeColors.whiteToWhiteOpacity20, veryLightGreyToEclipse: DarkThemeColors.veryLightGreyToEclipse),
          WTextFieldStyle(
            fillColor: DarkThemeColors.solitudeToNero,
            borderColor: DarkThemeColors.solitudeToDarkRider,
          )
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
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: DarkThemeColors.headline4,
    height: 1.2,
  );
  static const headline5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
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
