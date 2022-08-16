import 'package:flutter/material.dart';

class ThemedIcons extends ThemeExtension<ThemedIcons> {
  final String imageUrl;
  final String check;

  const ThemedIcons({required this.imageUrl, required this.check});

  @override
  ThemeExtension<ThemedIcons> copyWith({
    String? imageUrl,
    String? check,
  }) =>
      ThemedIcons(
        imageUrl: imageUrl ?? this.imageUrl,
        check: check ?? this.check,
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
    );
  }
}
