// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// abstract class DarkTheme {
//   /// More info for color schema: https://api.flutter.dev/flutter/material/ColorScheme-class.html
//   /// More info for theme: https://docs.flutter.dev/cookbook/design/themes
//
//   static ThemeData theme() => ThemeData(
//         fontFamily: 'NotoSans',
//         scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
//         indicatorColor: DarkThemeColors.navBarIndicator,
//         dividerColor: DarkThemeColors.divider,
//         hintColor: DarkThemeColors.hintColor,
//         appBarTheme: const AppBarTheme(
//           color: DarkThemeColors.appBarColor,
//           actionsIconTheme: CupertinoIconThemeData(
//             color: DarkThemeColors.appBarActionIcon,
//           ),
//         ),
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           backgroundColor: DarkThemeColors.navBarBackground,
//           selectedItemColor: DarkThemeColors.navBarSelected,
//           unselectedItemColor: DarkThemeColors.navBarUnselected,
//         ),
//         buttonTheme: const ButtonThemeData(
//           buttonColor: DarkThemeColors.buttonColor,
//           disabledColor: DarkThemeColors.buttonDisabledColor,
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           fillColor: DarkThemeColors.textFieldFillColor,
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: DarkThemeColors.textFieldBorderColor,
//               width: 1,
//             ),
//           ),
//           errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: DarkThemeColors.textFieldErrorBorderColor,
//               width: 1,
//             ),
//           ),
//         ),
//         textTheme: const TextTheme(
//           headline1: headline1,
//           headline2: headline2,
//           headline3: headline3,
//           headline4: headline4,
//           headline5: headline5,
//           headline6: headline6,
//           bodyText1: bodyText1,
//           bodyText2: bodyText2,
//           subtitle1: subTitle1,
//           subtitle2: subTitle2,
//           caption: caption,
//           button: button,
//         ),
//         colorScheme: const ColorScheme(
//           background: DarkThemeColors.background,
//           brightness: Brightness.dark,
//           primary: DarkThemeColors.primary,
//           secondary: DarkThemeColors.secondary,
//           error: DarkThemeColors.error,
//           surface: DarkThemeColors.surface,
//           onPrimary: DarkThemeColors.onPrimary,
//           onSecondary: DarkThemeColors.onSecondary,
//           onBackground: DarkThemeColors.onBackground,
//           onError: DarkThemeColors.onError,
//           onSurface: DarkThemeColors.onSurface,
//         ),
//         extensions: {
//           const WButtonStyle(
//             unselectedBackgroundColor: DarkThemeColors.buttonColor,
//             disabledColor: DarkThemeColors.buttonDisabledColor,
//             onButtonColor: DarkThemeColors.onButtonColor,
//             onDisabledButtonColor: DarkThemeColors.onDisabledButtonColor,
//           ),
//           MyFonts(
//             greyToOpacityWhite: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: DarkThemeColors.greyToOpacityWhite,
//             ),
//             dark2ToGrey: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: DarkThemeColors.dark2ToGrey,
//             ),
//             dark2ToPrimary: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//               color: DarkThemeColors.dark2ToPrimary,
//             ),
//             darkGreenToMainGreen: const TextStyle(
//               fontSize: 11,
//               fontWeight: FontWeight.w600,
//               color: DarkThemeColors.darkGreenToMainGreen,
//               height: 0.64,
//             ),
//             greyToWhite: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: DarkThemeColors.greyToWhite,
//               height: 1.3,
//             ),
//             mainGreenToWhite: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               color: DarkThemeColors.mainGreenToWhite,
//               height: 1.3,
//             ),
//             mainRedToWhite: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               color: DarkThemeColors.mainRedToWhite,
//               height: 1.3,
//             ),
//             dark1ToLightGreen: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: DarkThemeColors.dark1ToLightGreen,
//               letterSpacing: 0.3,
//             ),
//             dark1ToLightRed: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: DarkThemeColors.dark1ToLightRed,
//               letterSpacing: 0.3,
//             ),
//             darkGreyToPrimary: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: DarkThemeColors.darkGreyToPrimary,
//               letterSpacing: 0.3,
//             ),
//           ),
//           WTextfieldStyle(
//             fillColor: DarkThemeColors.textFieldFillColor,
//             borderColor: DarkThemeColors.textFieldBorderColor,
//             errorBorderColor: DarkThemeColors.textFieldErrorBorderColor,
//             hintColor: DarkThemeColors.hintColor,
//             textStyle: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: DarkThemeColors.textColor,
//             ),
//             secondaryFillColor: DarkThemeColors.secondaryTextFieldFillColor,
//             secondaryBorderColor: DarkThemeColors.secondaryTextFieldBorderColor,
//             eyeColor: DarkThemeColors.textFieldEyeColor,
//           ),
//           const LogoStyle(logoColor: DarkThemeColors.logoColor),
//           CircularProgressIndicatorStyle(
//             unselectedBackgroundColor: DarkThemeColors.progressIndicatorBackgroundColor,
//             foregroundColor: DarkThemeColors.progressIndicatorForegroundColor,
//           ),
//           const KeyPadStyle(
//             keyBackground: DarkThemeColors.keyBackground,
//             keyForeground: DarkThemeColors.keyForeground,
//           ),
//           const PinDotStyle(
//             onColor: DarkThemeColors.pinOnColor,
//             offColor: DarkThemeColors.pinOffColor,
//           ),
//           const WGoButtonStyle(
//             unselectedBackgroundColor: DarkThemeColors.wGoButtonColor,
//             onButtonColor: DarkThemeColors.wGoOnButtonColor,
//           ),
//           const DividerStyle(dividerColor: DarkThemeColors.dividerColor),
//           const LocalAuthItemStyle(
//             iconOffColor: DarkThemeColors.localAuthOffColor,
//             iconOnColor: DarkThemeColors.localAuthOnColor,
//             iconBackgroundColor: DarkThemeColors.localAuthIconBackgroundColor,
//           ),
//           PinFieldStyle(
//             borderColor: DarkThemeColors.pinFieldBorderColor,
//             fillColor: DarkThemeColors.pinFieldFillColor,
//             textColor: DarkThemeColors.pinFieldTextColor,
//             selectedBorderColor: DarkThemeColors.pinFieldSelectedBorderColor,
//           ),
//           WContainerStyle(
//             fillColor: DarkThemeColors.containerFillColor,
//             borderColor: DarkThemeColors.containerBorderColor,
//             boxShadow: DarkThemeColors.containerShadow,
//           ),
//           WTabBarStyle(
//             unselectedBackgroundColor: DarkThemeColors.tabBarBackgroundColor,
//             activeTabColor: DarkThemeColors.tabBarActiveTabColor,
//             onActiveTab: DarkThemeColors.tabBarOnActiveTab,
//             onPassiveTab: DarkThemeColors.tabBarOnPassiveTab,
//             tabDivider: DarkThemeColors.tabBarTabDivider,
//           ),
//           CancelButtonStyle(
//             unselectedBackgroundColor: DarkThemeColors.cancelButtonBackground,
//             onButtonColor: DarkThemeColors.cancelOnButtonBackground,
//           ),
//           ThemedColors(
//             darkGreyToOpacityWhite: DarkThemeColors.darkGreyToOpacityWhite,
//             opacityGreenToGreen: DarkThemeColors.opacityGreenToGreen,
//             eef0f2To252529: DarkThemeColors.eef0f2To252529,
//             f8f8faTo2b2b30: DarkThemeColors.f8f8faTo2b2b30,
//             opacityRedToRed: DarkThemeColors.opacityRedToRed,
//             e6e9efToOpacityWhite: DarkThemeColors.e6e9efToOpacityWhite,
//             darkGreyTo6a6a6e: DarkThemeColors.darkGreyTo6a6a6e,
//             f8f8faToOpacityWhite: DarkThemeColors.f8f8faToOpacityWhite,
//             blackToWhite: DarkThemeColors.blackToWhite,
//             dark2ToOpacityWhite10: DarkThemeColors.dark2ToOpacityWhite10,
//             solitudeToDark2: DarkThemeColors.solitudeToDark2,
//             solitudeToDark1: DarkThemeColors.solitudeToDark1,
//             solitudeOpacityWhite10: DarkThemeColors.solitudeOpacityWhite10,
//             shimmerColor1: DarkThemeColors.shimmerColor1,
//             shimmerColor2: DarkThemeColors.shimmerColor2,
//             shimmerColor3: DarkThemeColors.shimmerColor3,
//             transparentToGreen: DarkThemeColors.transparentToGreen,
//             mischkaToDolphin: DarkThemeColors.mischkaToDolphin,
//             //transparentToGreen: DarkThemeColors.transparentToGreen,
//             eff1f5To252529: DarkThemeColors.eff1f5To252529,
//             whiteTo252529: DarkThemeColors.whiteTo252529,
//             whiteTo2B2B30: DarkThemeColors.whiteTo252529,
//             f8f8faToDark: DarkThemeColors.f8f8faToDark,
//             whiteToDark: DarkThemeColors.whiteToDark,
//             eff1f5To2b2b30: DarkThemeColors.eff1f5To2b2b30,
//             solitudeToJaguar: DarkThemeColors.solitudeToJaguar,
//             yellowToGery: DarkThemeColors.yellowToGery,
//             kournikovaToStormGrey: DarkThemeColors.kournikovaToStormGrey,
//             darkToWhite: DarkThemeColors.darkToWhite,
//             whiteToOpacityWhite: DarkThemeColors.whiteToOpacityWhite,
//             c32B141To1B9684: DarkThemeColors.c32B141To1B9684,
//             eff1f5To1c1c20: DarkThemeColors.eff1f5To1c1c20,
//           ),
//           const StickyHeaderStyle(
//             unselectedBackgroundColor: DarkThemeColors.stickyHeaderBackgroundColor,
//             titleColor: DarkThemeColors.stickyHeaderTitleColor,
//           ),
//           WBottomSheetStyle(
//             unselectedBackgroundColor: DarkThemeColors.bottomSheetBackgroundColor,
//             titleColor: DarkThemeColors.bottomSheetTitleColor,
//             iconBackgroundColor: DarkThemeColors.bottomSheetIconBackgroundColor,
//             barrierColor: DarkThemeColors.bottomSheetBarrierColor,
//           ),
//         },
//       );
//
//   // Fonts
//   static const headline1 = TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.w700,
//     color: DarkThemeColors.headline1,
//     height: 1.3,
//   );
//   static const headline2 = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//     color: DarkThemeColors.headline2,
//     height: 1.3,
//   );
//   static const headline3 = TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//     color: DarkThemeColors.headline3,
//   );
//   static const headline4 = TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.w700,
//     color: DarkThemeColors.headline4,
//     height: 1.2,
//   );
//   static const headline5 = TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.w700,
//     color: DarkThemeColors.headline5,
//     height: 1.33,
//   );
//   static const headline6 = TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     height: 1.25,
//     color: DarkThemeColors.headline6,
//   );
//   static const bodyText1 = TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//     height: 1.4,
//     color: DarkThemeColors.bodyText1,
//   );
//
//   static const bodyText2 = TextStyle(
//     fontSize: 15,
//     fontWeight: FontWeight.w500,
//     letterSpacing: -0.3,
//     color: DarkThemeColors.bodyText2,
//   );
//
//   static const subTitle1 = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//     color: DarkThemeColors.subTitle1,
//   );
//
//   static const subTitle2 = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//     color: DarkThemeColors.subTitle2,
//   );
//
//   static const caption = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     color: DarkThemeColors.caption,
//   );
//
//   static const button = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     color: DarkThemeColors.button,
//   );
// }
