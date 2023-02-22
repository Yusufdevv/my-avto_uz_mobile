import 'package:flutter/material.dart';

Widget nexContainer(Color color, String text) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 44,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        // color: LightThemeColors.headlineSmall,
      ),
      child: Center(
        child: Text(
          //LocaleKeys.further.tr(),
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
