import 'package:flutter/material.dart';
import '../../gradient_generator.dart';

/// A collection of reusable gradient presets.
class GradientPresets {
  static LinearGradient get sunset => GradientX.linear(
        colors: [const Color(0xFFFF5F6D), const Color(0xFFFFC371)],
        angle: 45,
      );

  static LinearGradient get mint => GradientX.linear(
        colors: [const Color(0xFF98FF98), const Color(0xFF00D2FF)],
        angle: 90,
      );

  static RadialGradient get cool => GradientX.radial(
        colors: [const Color(0xFF2193b0), const Color(0xFF6dd5ed)],
        radius: 0.8,
      );

  static LinearGradient get fire => GradientX.linear(
        colors: [const Color(0xFFFF512F), const Color(0xFFDD2476)],
        angle: 135,
      );

  static LinearGradient get ocean => GradientX.linear(
        colors: [const Color(0xFF00B4DB), const Color(0xFF0083B0)],
        angle: 45,
      );

  static LinearGradient get royal => GradientX.linear(
        colors: [const Color(0xFF141E30), const Color(0xFF243B55)],
        angle: 90,
      );

  static LinearGradient get peach => GradientX.linear(
        colors: [const Color(0xFFFFB347), const Color(0xFFFFCC33)],
        angle: 60,
      );

  static LinearGradient get grape => GradientX.linear(
        colors: [const Color(0xFFB993D6), const Color(0xFF8CA6DB)],
        angle: 45,
      );

  static LinearGradient get neon => GradientX.linear(
        colors: [
          const Color(0xFF0F2027),
          const Color(0xFF203A43),
          const Color(0xFF2C5364)
        ],
        angle: 90,
      );

  static LinearGradient get aqua => GradientX.linear(
        colors: [const Color(0xFF13547A), const Color(0xFF80D0C7)],
        angle: 120,
      );

  static LinearGradient get cherry => GradientX.linear(
        colors: [const Color(0xFFEB3349), const Color(0xFFF45C43)],
        angle: 90,
      );

  static RadialGradient get sky => GradientX.radial(
        colors: [const Color(0xFF89F7FE), const Color(0xFF66A6FF)],
        radius: 0.85,
      );
}
