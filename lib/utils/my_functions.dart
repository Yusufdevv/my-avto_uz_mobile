import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/profile/presentation/pages/sms_code.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

// ignore: avoid_classes_with_only_static_members
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

  static String getFormatCost(String cost) {
    String oldCost = cost;
    if (cost.contains('.')) {
      List<String> arr = cost.split('.');
      oldCost = arr.first;
    }
    String newCost = "";
    for (int i = 0; i < oldCost.length; i++) {
      if ((oldCost.length - i) % 3 == 0) newCost += ' ';
      newCost += oldCost[i];
    }
    return newCost.trimLeft();
  }

  static String getHoursFormat(String data) =>
      Jiffy(data).format('h-mm').replaceAll('-', ':').toString();
  static String phoneFormatter(String content, List<int> stopsList) {
    final buffer = StringBuffer();
    for (int i = 0; i < content.length; i++) {
      if (stopsList.contains(i + 1)) {
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }

  static String getMonthByIndex(int index) {
    switch (index) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }

  static String getDateNamedMonth(String data) {
    final list = data.substring(0, 10).split('-');

    return '${list[2]} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}, ${list[0]} г.';
  }

  static String getAutoPublishDate(String data) {
    final dateNow = DateTime.now();
    final date = getDateNamedMonth(data).split(',');
    final dateDay = int.parse(date[0].split(' ')[0]);
    final dateYear = int.parse(date[1].trim().split(' ')[0]);
    if (dateDay == dateNow.day) {
      return 'Сегодня';
    } else if (dateDay == (dateNow.day - 1)) {
      return 'Вчера';
    } else if (dateYear == dateNow.year) {
      return date[0];
    } else {
      return getDateNamedMonth(data);
    }
  }

  static bool enableForCalling(
      {required String callFrom, required String callTo}) {
    final now = DateTime.now();

    final dateFrom = DateTime(
      2022,
      1,
      1,
      int.parse(callFrom.substring(0, 2)),
      int.parse(callFrom.substring(3, 5)),
      int.parse(callFrom.substring(6)),
    );
    final dateTo = DateTime(
      2022,
      1,
      1,
      int.parse(callTo.substring(0, 2)),
      int.parse(callTo.substring(3, 5)),
      int.parse(callTo.substring(6)),
    );
    return now.isAfter(dateFrom) && now.isBefore(dateTo);
  }
}
