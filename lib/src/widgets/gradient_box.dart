import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';

enum GradientType { linear, radial, sweep }

class GradientBox extends StatelessWidget {
  final List<Color> colors;
  final GradientType type;
  final double angle;
  final List<double>? stops;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Clip clipBehavior;

  const GradientBox({
    super.key,
    required this.colors,
    this.type = GradientType.linear,
    this.angle = 0,
    this.stops,
    this.alignment,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    final Gradient gradient = type == GradientType.linear
        ? GradientX.linear(colors: colors, angle: angle, stops: stops)
        : GradientX.radial(colors: colors, stops: stops);

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: alignment,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
