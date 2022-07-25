import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/themes/theme_extensions/checkbox_style.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
        appBarTheme: const AppBarTheme(
          color: LightThemeColors.appBarColor,
          actionsIconTheme: CupertinoIconThemeData(
            color: LightThemeColors.appBarActionIcon,
          ),
        ),
        colorScheme: const ColorScheme(
          background: LightThemeColors.surface,
          brightness: Brightness.dark,
          primary: LightThemeColors.navBarIndicator,
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
              unselectedBorderColor: LightThemeColors.warmerGreyToDarkGray),
          ThemedColors(
              dividerColorToGrey: LightThemeColors.dividerColorToGrey,
              darkToWhite: LightThemeColors.darkToWhite,
              prussianBlueToWhite80: LightThemeColors.prussianBlueToWhite80,
              dodgerBlueToWhite80: LightThemeColors.dodgerBlueToWhite80,
              blackToWhite80: LightThemeColors.blackToWhite80,
              solitudeToCharcoal: LightThemeColors.solitudeToCharcoal,
              solitudeToDarkGray95: LightThemeColors.solitudeToDarkGray95,
              whiteToWhiteOpacity20: LightThemeColors.whiteToWhiteOpacity20,
              veryLightGreyToEclipse: LightThemeColors.veryLightGreyToEclipse,
              transparentToSolitude12: LightThemeColors.transparentToSolitude12,
              whiteToDolphin: LightThemeColors.whiteToDolphin,
            solitudeToBastille: LightThemeColors.solitudeToBastille,
              solitudeToSolitude14: LightThemeColors.solitudeToSolitude14,
              solitudeToWhite35: LightThemeColors.solitudeToWhite35
          ),
          WTextFieldStyle(
              fillColor: LightThemeColors.solitudeToNero,
              borderColor: LightThemeColors.solitudeToDarkRider)
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
    fontWeight: FontWeight.w700,
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
