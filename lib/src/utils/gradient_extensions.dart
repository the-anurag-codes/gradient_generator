import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';

enum GradientMood {
  vibrant,
  soft,
  dark,
  pastel,
  neon,
  faded,
  metallic,
  warm,
  cool,
  complimentary,
}

class GradientXExtended {
  /// Customizable gradient from base color via HSL shifts.
  static Gradient auto({
    required Color baseColor,
    double lightnessShift = 0.2,
    double saturationShift = 0.1,
    double angle = 45,
    GradientType type = GradientType.linear,
  }) {
    final hsl = HSLColor.fromColor(baseColor);
    final c1 = hsl
        .withSaturation((hsl.saturation + saturationShift).clamp(0.0, 1.0))
        .withLightness((hsl.lightness - lightnessShift).clamp(0.0, 1.0))
        .toColor();
    final c2 = hsl
        .withSaturation((hsl.saturation - saturationShift).clamp(0.0, 1.0))
        .withLightness((hsl.lightness + lightnessShift).clamp(0.0, 1.0))
        .toColor();

    return type == GradientType.linear
        ? GradientX.linear(colors: [c1, c2], angle: angle)
        : GradientX.radial(colors: [c1, c2]);
  }

  /// Quick mood-based gradient generation.
  static Gradient fromMood({
    required Color baseColor,
    required GradientMood mood,
    double angle = 45,
    GradientType type = GradientType.linear,
  }) {
    final hsl = HSLColor.fromColor(baseColor);
    late Color c1, c2;

    switch (mood) {
      case GradientMood.vibrant:
        c1 = hsl.withSaturation(1.0).withLightness(0.55).toColor();
        c2 = hsl.withSaturation(0.9).withLightness(0.35).toColor();
        break;
      case GradientMood.soft:
        c1 = hsl.withSaturation(0.4).withLightness(0.8).toColor();
        c2 = hsl.withSaturation(0.3).withLightness(0.6).toColor();
        break;
      case GradientMood.dark:
        c1 = hsl.withLightness(0.2).toColor();
        c2 = hsl.withLightness(0.1).toColor();
        break;
      case GradientMood.pastel:
        c1 = hsl.withSaturation(0.3).withLightness(0.85).toColor();
        c2 = hsl.withSaturation(0.2).withLightness(0.75).toColor();
        break;
      case GradientMood.neon:
        c1 = hsl.withSaturation(1.0).withLightness(0.6).toColor();
        c2 = hsl.withHue((hsl.hue + 40) % 360).withLightness(0.7).toColor();
        break;
      case GradientMood.faded:
        c1 = hsl.withSaturation(0.15).withLightness(0.75).toColor();
        c2 = hsl.withSaturation(0.1).withLightness(0.65).toColor();
        break;
      case GradientMood.metallic:
        c1 = hsl.withSaturation(0.05).withLightness(0.55).toColor();
        c2 = hsl.withSaturation(0.0).withLightness(0.75).toColor();
        break;
      case GradientMood.warm:
        final warmHue = (hsl.hue + 20) % 360;
        c1 = hsl.withHue(warmHue).withLightness(0.5).toColor();
        c2 = hsl.withHue(warmHue + 10).withLightness(0.35).toColor();
        break;
      case GradientMood.cool:
        final coolHue = (hsl.hue + 200) % 360;
        c1 = hsl.withHue(coolHue).withLightness(0.45).toColor();
        c2 = hsl.withHue(coolHue + 15).withLightness(0.3).toColor();
        break;
      case GradientMood.complimentary:
        final complementHue = (hsl.hue + 180) % 360;
        c1 = hsl.toColor();
        c2 = hsl.withHue(complementHue).toColor();
        break;
    }

    return type == GradientType.linear
        ? GradientX.linear(colors: [c1, c2], angle: angle)
        : GradientX.radial(colors: [c1, c2]);
  }
}
