library gradient_generator;

import 'dart:math';
import 'package:flutter/material.dart';
export 'src/models/gradient_model.dart';
export 'src/widgets/gradient_container.dart';
export 'src/presets/gradient_presets.dart';
export 'src/widgets/gradient_box.dart';
export 'src/widgets/gradient_text.dart';
export 'src/widgets/gradient_border_box.dart';
export 'src/widgets/gradient_button.dart';
export 'src/widgets/gradient_icon.dart';
export 'src/utils/gradient_extensions.dart';
export 'src/utils/gradient_random.dart';

/// Fluent API for creating common gradients.
class GradientX {
  /// Create linear gradient with optional angle in degrees.
  static LinearGradient linear({
    required List<Color> colors,
    List<double>? stops,
    double angle = 0,
    TileMode tileMode = TileMode.clamp,
  }) {
    final rad = angle * (3.1415926535897932 / 180);
    final begin = Alignment(
        cos(rad - 3.1415926535897932 / 2), sin(rad - 3.1415926535897932 / 2));
    final end = Alignment(
        cos(rad + 3.1415926535897932 / 2), sin(rad + 3.1415926535897932 / 2));
    return LinearGradient(
      colors: colors,
      stops: stops,
      begin: begin,
      end: end,
      tileMode: tileMode,
    );
  }

  /// Radial gradient shortcut
  static RadialGradient radial({
    required List<Color> colors,
    List<double>? stops,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    TileMode tileMode = TileMode.clamp,
  }) {
    return RadialGradient(
      colors: colors,
      stops: stops,
      center: center,
      radius: radius,
      tileMode: tileMode,
    );
  }
}
