import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/profile/presentation/pages/sms_code.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MyFunctions {
  static String getData(String data) =>
      Jiffy(data).format('dd-MM-yyyy').replaceAll('-', '/').toString();
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

  static String getHours(String data) =>
      Jiffy(data).format('h-mm').replaceAll('-', ':').toString();

  static String getFormattedPrice(String content, List<int> stopsList) {
    final buffer = StringBuffer();
    for (var i = 0; i < content.length; i++) {
      if (stopsList.contains(i + 1)) {
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }

  static String getHours(String data) =>
      Jiffy(data).format('h-mm').replaceAll('-', ':').toString();
}
