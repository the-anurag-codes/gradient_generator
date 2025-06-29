import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';

class GradientAnimation extends StatefulWidget {
  final Duration duration;
  final bool loop;
  final double angleStart;
  final double angleEnd;
  final GradientType type;
  final Widget? child;
  final List<Color>? colorsStart;
  final List<Color>? colorsEnd;

  const GradientAnimation({
    super.key,
    this.duration = const Duration(seconds: 5),
    this.loop = true,
    this.angleStart = 0,
    this.angleEnd = 360,
    this.type = GradientType.linear,
    this.child,
    this.colorsStart,
    this.colorsEnd,
  });

  @override
  State<GradientAnimation> createState() => _GradientAnimationState();
}

class _GradientAnimationState extends State<GradientAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  late final List<Color> _startColors;
  late final List<Color> _endColors;
  late final Tween<double> _angleTween;

  @override
  void initState() {
    super.initState();
    _startColors =
        widget.colorsStart ?? GradientXRandom.generate(colorCount: 2).colors;
    _endColors = widget.colorsEnd ??
        GradientXRandom.generate(colorCount: _startColors.length).colors;
    _angleTween = Tween(begin: widget.angleStart, end: widget.angleEnd);

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.loop) {
      _controller.repeat(reverse: true);
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Color> _interpolatedColors(double t) {
    return List.generate(_startColors.length, (i) {
      return Color.lerp(_startColors[i], _endColors[i], t) ?? _startColors[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final colors = _interpolatedColors(_animation.value);
        final angle = _angleTween.evaluate(_animation);

        final gradient = switch (widget.type) {
          GradientType.linear => GradientX.linear(colors: colors, angle: angle),
          GradientType.radial => GradientX.radial(colors: colors),
          GradientType.sweep => SweepGradient(colors: colors),
        };

        return GradientContainer(
          gradient: gradient,
          child: widget.child,
        );
      },
    );
  }
}
