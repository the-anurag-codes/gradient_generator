import 'package:flutter/material.dart';

/// A box with solid background and a gradient border.
class GradientBorderBox extends StatelessWidget {
  final List<Color> borderColors;
  final Widget child;
  final double borderWidth;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const GradientBorderBox({
    super.key,
    required this.borderColors,
    required this.child,
    this.borderWidth = 2.0,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: borderColors),
        borderRadius: borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius
              ?.subtract(BorderRadius.all(Radius.circular(borderWidth))),
        ),
        padding: EdgeInsets.all(borderWidth),
        child: child,
      ),
    );
  }
}
