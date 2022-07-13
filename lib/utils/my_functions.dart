import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/profile/presentation/pages/sms_code.dart';
import 'package:flutter/material.dart';

class MyFunctions {
  static Color mapCategoryIndexToColor(final int index) {
    switch (index) {
      case 0:
        return red;
      case 1:
        return blue;
      case 2:
        return green;
      case 3:
        return yellow;
      default:
        return white;
    }
  }

  static String getCodePageTitle(CodePageType codePageType) {
    switch (codePageType) {
      case CodePageType.forgot:
        return 'LocaleKeys.forgot_password.tr()';
      case CodePageType.login:
        return ' LocaleKeys.authorization.tr()';
      case CodePageType.register:
        return 'LocaleKeys.register.tr()';
      default:
        return '';
    }
  }
}
