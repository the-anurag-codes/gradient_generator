import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_generator/gradient_generator.dart';

void main() {
  test('Linear gradient with angle 0 should be top-to-bottom', () {
    final grad = GradientX.linear(colors: [Colors.red, Colors.blue], angle: 0);
    final begin = grad.begin as Alignment;
    final end = grad.end as Alignment;

    expect(begin.x, closeTo(0.0, 0.001));
    expect(begin.y, closeTo(-1.0, 0.001));
    expect(end.x, closeTo(0.0, 0.001));
    expect(end.y, closeTo(1.0, 0.001));
  });

  test('Preset sunset colors and stops', () {
    final preset = GradientPresets.sunset;
    expect(preset.colors.length, 2);
    expect(preset.colors.first, const Color(0xFFFF5F6D));
  });
}
