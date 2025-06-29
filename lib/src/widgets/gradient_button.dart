import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<Color> colors;
  final double angle;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.colors,
    this.angle = 0,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.width,
    this.height,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          gradient: GradientX.linear(colors: colors, angle: angle),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
        ),
        child: Center(child: child),
      ),
    );
  }
}
