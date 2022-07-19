import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limon_pay/assets/colors/light.dart';
import 'package:limon_pay/assets/themes/theme_extensions/cancel_button_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/circular_progress_indicator_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/divider_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/key_pad_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/local_auth_item_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/logo_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/my_fonts.dart';
import 'package:limon_pay/assets/themes/theme_extensions/pin_dot_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/pin_field_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/sticky_header_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/themed_colors.dart';
import 'package:limon_pay/assets/themes/theme_extensions/w_bottomsheet_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/w_button_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/w_container_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/w_go_button_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/w_tab_bar_style.dart';
import 'package:limon_pay/assets/themes/theme_extensions/w_textfield_style.dart';

abstract class LightTheme {
  /// More info for color schema: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  /// More info for theme: https://docs.flutter.dev/cookbook/design/themes

  static ThemeData theme() => ThemeData(
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
        backgroundColor: LightThemeColors.background,
        indicatorColor: LightThemeColors.navBarIndicator,
        dividerColor: LightThemeColors.divider,
        hintColor: LightThemeColors.hintColor,
        appBarTheme: const AppBarTheme(
          color: LightThemeColors.appBarColor,
          actionsIconTheme: CupertinoIconThemeData(
            color: LightThemeColors.appBarActionIcon,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: LightThemeColors.navBarBackground,
          selectedItemColor: LightThemeColors.navBarSelected,
          unselectedItemColor: LightThemeColors.navBarUnselected,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: LightThemeColors.buttonColor,
          disabledColor: LightThemeColors.buttonDisabledColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: LightThemeColors.textFieldFillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightThemeColors.textFieldBorderColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightThemeColors.textFieldErrorBorderColor,
              width: 1,
            ),
          ),
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
        colorScheme: const ColorScheme(
          background: LightThemeColors.background,
          brightness: Brightness.light,
          primary: LightThemeColors.primary,
          secondary: LightThemeColors.secondary,
          error: LightThemeColors.error,
          surface: LightThemeColors.surface,
          onPrimary: LightThemeColors.onPrimary,
          onSecondary: LightThemeColors.onSecondary,
          onBackground: LightThemeColors.onBackground,
          onError: LightThemeColors.onError,
          onSurface: LightThemeColors.onSurface,
        ),
        extensions: {
          const WButtonStyle(
            backgroundColor: LightThemeColors.buttonColor,
            disabledColor: LightThemeColors.buttonDisabledColor,
            onButtonColor: LightThemeColors.onButtonColor,
            onDisabledButtonColor: LightThemeColors.onDisabledButtonColor,
          ),
          MyFonts(
            greyToOpacityWhite: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: LightThemeColors.greyToOpacityWhite,
            ),
            dark2ToGrey: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: LightThemeColors.dark2ToGrey,
            ),
            dark2ToPrimary: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: LightThemeColors.dark2ToPrimary,
            ),
            darkGreenToMainGreen: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: LightThemeColors.darkGreenToMainGreen,
              height: 0.64,
            ),
            greyToWhite: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: LightThemeColors.greyToWhite,
              height: 1.3,
            ),
            mainGreenToWhite: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: LightThemeColors.mainGreenToWhite,
              height: 1.3,
            ),
            mainRedToWhite: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: LightThemeColors.mainRedToWhite,
              height: 1.3,
            ),
            dark1ToLightGreen: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: LightThemeColors.dark1ToLightGreen,
              letterSpacing: 0.3,
            ),
            dark1ToLightRed: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: LightThemeColors.dark1ToLightRed,
              letterSpacing: 0.3,
            ),
            darkGreyToPrimary: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: LightThemeColors.darkGreyToPrimary,
              letterSpacing: 0.3,
            ),
          ),
          const WTextfieldStyle(
            fillColor: LightThemeColors.textFieldFillColor,
            borderColor: LightThemeColors.textFieldBorderColor,
            errorBorderColor: LightThemeColors.textFieldErrorBorderColor,
            hintColor: LightThemeColors.hintColor,
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: LightThemeColors.textColor,
            ),
            secondaryFillColor: LightThemeColors.secondaryTextFieldFillColor,
            secondaryBorderColor:
                LightThemeColors.secondaryTextFieldBorderColor,
            eyeColor: LightThemeColors.textFieldEyeColor,
          ),
          const LogoStyle(logoColor: LightThemeColors.logoColor),
          CircularProgressIndicatorStyle(
            backgroundColor: LightThemeColors.progressIndicatorBackgroundColor,
            foregroundColor: LightThemeColors.progressIndicatorForegroundColor,
          ),
          const KeyPadStyle(
            keyBackground: LightThemeColors.keyBackground,
            keyForeground: LightThemeColors.keyForeground,
          ),
          const PinDotStyle(
            onColor: LightThemeColors.pinOnColor,
            offColor: LightThemeColors.pinOffColor,
          ),
          const WGoButtonStyle(
            backgroundColor: LightThemeColors.wGoButtonColor,
            onButtonColor: LightThemeColors.wGoOnButtonColor,
          ),
          const DividerStyle(dividerColor: LightThemeColors.dividerColor),
          const LocalAuthItemStyle(
            iconOffColor: LightThemeColors.localAuthOffColor,
            iconOnColor: LightThemeColors.localAuthOnColor,
            iconBackgroundColor: LightThemeColors.localAuthIconBackgroundColor,
          ),
          const PinFieldStyle(
            borderColor: LightThemeColors.pinFieldBorderColor,
            fillColor: LightThemeColors.pinFieldFillColor,
            textColor: LightThemeColors.pinFieldTextColor,
            selectedBorderColor: LightThemeColors.pinFieldSelectedBorderColor,
          ),
          WContainerStyle(
            fillColor: LightThemeColors.containerFillColor,
            borderColor: LightThemeColors.containerBorderColor,
            boxShadow: LightThemeColors.containerShadow,
          ),
          const WTabBarStyle(
            backgroundColor: LightThemeColors.tabBarBackgroundColor,
            activeTabColor: LightThemeColors.tabBarActiveTabColor,
            onActiveTab: LightThemeColors.tabBarOnActiveTab,
            onPassiveTab: LightThemeColors.tabBarOnPassiveTab,
            tabDivider: LightThemeColors.tabBarTabDivider,
          ),
          CancelButtonStyle(
            backgroundColor: LightThemeColors.cancelButtonBackground,
            onButtonColor: LightThemeColors.cancelOnButtonBackground,
          ),
          ThemedColors(
            darkGreyToOpacityWhite: LightThemeColors.darkGreyToOpacityWhite,
            opacityGreenToGreen: LightThemeColors.opacityGreenToGreen,
            eef0f2To252529: LightThemeColors.eef0f2To252529,
            f8f8faTo2b2b30: LightThemeColors.f8f8faTo2b2b30,
            opacityRedToRed: LightThemeColors.opacityRedToRed,
            e6e9efToOpacityWhite: LightThemeColors.e6e9efToOpacityWhite,
            darkGreyTo6a6a6e: LightThemeColors.darkGreyTo6a6a6e,
            f8f8faToOpacityWhite: LightThemeColors.f8f8faToOpacityWhite,
            blackToWhite: LightThemeColors.blackToWhite,
            dark2ToOpacityWhite10: LightThemeColors.dark2ToOpacityWhite10,
            solitudeToDark2: LightThemeColors.solitudeToDark2,
            solitudeToDark1: LightThemeColors.solitudeToDark1,
            solitudeOpacityWhite10: LightThemeColors.solitudeOpacityWhite10,
            shimmerColor1: LightThemeColors.shimmerColor1,
            shimmerColor2: LightThemeColors.shimmerColor2,
            shimmerColor3: LightThemeColors.shimmerColor3,
            transparentToGreen: LightThemeColors.transparentToGreen,
            mischkaToDolphin: LightThemeColors.mischkaToDolphin,
            eff1f5To252529: LightThemeColors.eff1f5To252529,
            whiteTo252529: LightThemeColors.whiteTo252529,
            whiteTo2B2B30: LightThemeColors.whiteTo252529,
            f8f8faToDark: LightThemeColors.f8f8faToDark,
            whiteToDark: LightThemeColors.whiteToDark,
            eff1f5To2b2b30: LightThemeColors.eff1f5To2b2b30,
            solitudeToJaguar: LightThemeColors.solitudeToJaguar,
            yellowToGery: LightThemeColors.yellowToGery,
            kournikovaToStormGrey: LightThemeColors.kournikovaToStormGrey,
            darkToWhite: LightThemeColors.darkToWhite,
            whiteToOpacityWhite: LightThemeColors.whiteToOpacityWhite,
            c32B141To1B9684: LightThemeColors.c32B141To1B9684,
            eff1f5To1c1c20: LightThemeColors.eff1f5To1c1c20,
          ),
          const StickyHeaderStyle(
            backgroundColor: LightThemeColors.stickyHeaderBackgroundColor,
            titleColor: LightThemeColors.stickyHeaderTitleColor,
          ),
          WBottomSheetStyle(
            backgroundColor: LightThemeColors.bottomSheetBackgroundColor,
            titleColor: LightThemeColors.bottomSheetTitleColor,
            iconBackgroundColor:
                LightThemeColors.bottomSheetIconBackgroundColor,
            barrierColor: LightThemeColors.bottomSheetBarrierColor,
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
