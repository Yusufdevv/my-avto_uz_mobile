import 'package:auto/assets/colors/light.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget nexContainer() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
      height: 44,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: LightThemeColors.headline5,
      ),
      child: Center(
        child: Text(
          LocaleKeys.further.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
