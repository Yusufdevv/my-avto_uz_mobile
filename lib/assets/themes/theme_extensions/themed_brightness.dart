import 'package:flutter/material.dart';

class ThemedBrightness extends ThemeExtension<ThemedBrightness> {
  final Brightness brightness;

  const ThemedBrightness({required this.brightness});

  @override
  ThemeExtension<ThemedBrightness> copyWith({Brightness? brightness}) =>
      ThemedBrightness(brightness: brightness ?? this.brightness);

  @override
  ThemeExtension<ThemedBrightness> lerp(
      ThemeExtension<ThemedBrightness>? other, double t) {
    if (other is! ThemedBrightness) {
      return this;
    }
    return ThemedBrightness(brightness: brightness);
  }
}
