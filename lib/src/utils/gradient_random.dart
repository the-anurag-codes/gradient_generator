import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';

class GradientXRandom {
  static final _rand = Random();

  /// Generates a visually balanced random gradient.
  static Gradient generate({
    int colorCount = 2,
    GradientType type = GradientType.linear,
    double angle = 45,
    int? seed,
  }) {
    final random = seed != null ? Random(seed) : _rand;
    final List<Color> colors = List.generate(colorCount, (_) {
      final h = random.nextDouble() * 360;
      final s = 0.4 + random.nextDouble() * 0.6; // 0.4 - 1.0
      final l = 0.4 + random.nextDouble() * 0.4; // 0.4 - 0.8
      return HSLColor.fromAHSL(1.0, h, s, l).toColor();
    });

    return type == GradientType.linear
        ? GradientX.linear(colors: colors, angle: angle)
        : GradientX.radial(colors: colors);
  }
}
