// ignore_for_file: prefer_asserts_with_message, unnecessary_null_comparison

import 'dart:math' as math;

import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CustomThumb extends SliderComponentShape {
  /// Create a slider thumb that draws a circle.
  const CustomThumb({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
  });

  /// The preferred radius of the round thumb shape when the slider is enabled.
  ///
  /// If it is not provided, then the Material Design default of 10 is used.
  final double enabledThumbRadius;

  /// The preferred radius of the round thumb shape when the slider is disabled.
  ///
  /// If no disabledRadius is provided, then it is equal to the
  /// [enabledThumbRadius]
  final double? disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  /// The resting elevation adds shadow to the unpressed thumb.
  ///
  /// The default is 1.
  ///
  /// Use 0 for no shadow. The higher the value, the larger the shadow. For
  /// example, a value of 12 will create a very large shadow.
  ///
  final double elevation;

  /// The pressed elevation adds shadow to the pressed thumb.
  ///
  /// The default is 6.
  ///
  /// Use 0 for no shadow. The higher the value, the larger the shadow. For
  /// example, a value of 12 will create a very large shadow.
  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.fromRadius(
      isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final canvas = context.canvas;
    final radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final color = colorTween.evaluate(enableAnimation)!;
    final radius = radiusTween.evaluate(enableAnimation);

    final elevationTween = Tween<double>(
      begin: elevation,
      end: pressedElevation,
    );

    final evaluatedElevation = elevationTween.evaluate(activationAnimation);
    final path = Path()
      ..addArc(
          Rect.fromCenter(
              center: center, width: 2 * radius, height: 2 * radius),
          0,
          math.pi * 2);
    canvas
      ..drawShadow(path, Colors.white, evaluatedElevation, true)
      ..drawCircle(
        center,
        radius,
        Paint()..color = Colors.white,
      )
      ..drawCircle(center, 6, Paint()..color = orange);
  }
}
