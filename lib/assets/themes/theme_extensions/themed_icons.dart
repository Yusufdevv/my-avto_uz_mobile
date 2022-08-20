import 'package:flutter/material.dart';

class ThemedIcons extends ThemeExtension<ThemedIcons> {
  final String imageUrl;
  final String check;
  final String filterIcon;
  final String autoUzLightDark;

  const ThemedIcons(
      {required this.filterIcon,
      required this.imageUrl,
      required this.check,
      required this.autoUzLightDark});

  @override
  ThemeExtension<ThemedIcons> copyWith(
          {String? imageUrl,
          String? check,
          String? filterIcon,
          String? autoUzLightDark}) =>
      ThemedIcons(
        autoUzLightDark: autoUzLightDark ?? this.autoUzLightDark,
        imageUrl: imageUrl ?? this.imageUrl,
        check: check ?? this.check,
        filterIcon: filterIcon ?? this.filterIcon,
      );

  @override
  ThemeExtension<ThemedIcons> lerp(
      ThemeExtension<ThemedIcons>? other, double t) {
    if (other is! ThemedIcons) {
      return this;
    }
    return ThemedIcons(
      imageUrl: imageUrl,
      check: check,
      filterIcon: filterIcon,
      autoUzLightDark: autoUzLightDark,
    );
  }
}
