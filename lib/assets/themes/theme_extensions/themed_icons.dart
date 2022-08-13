import 'package:flutter/material.dart';

class ThemedIcons extends ThemeExtension<ThemedIcons> {
  final String imageUrl;
  final String filterIcon;

  const ThemedIcons({
    required this.imageUrl,
    required this.filterIcon,
  });

  @override
  ThemeExtension<ThemedIcons> copyWith(
          {String? imageUrl, String? filterIcon}) =>
      ThemedIcons(
          imageUrl: imageUrl ?? this.imageUrl,
          filterIcon: filterIcon ?? this.filterIcon);

  @override
  ThemeExtension<ThemedIcons> lerp(
      ThemeExtension<ThemedIcons>? other, double t) {
    if (other is! ThemedIcons) {
      return this;
    }
    return ThemedIcons(imageUrl: imageUrl, filterIcon: filterIcon);
  }
}
