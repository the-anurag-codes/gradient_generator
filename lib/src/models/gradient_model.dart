import 'package:flutter/material.dart';

/// Model representing a gradient definition.
class GradientModel {
  final List<Color> colors;
  final List<double>? stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final TileMode tileMode;

  GradientModel({
    required this.colors,
    this.stops,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.tileMode = TileMode.clamp,
  });
}
