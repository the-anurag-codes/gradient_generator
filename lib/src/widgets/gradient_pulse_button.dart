import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';

class GradientPulseButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final List<Color> colors;
  final double borderRadius;
  final Duration pulseDuration;

  const GradientPulseButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.colors,
    this.borderRadius = 12,
    this.pulseDuration = const Duration(seconds: 2),
  });

  @override
  State<GradientPulseButton> createState() => _GradientPulseButtonState();
}

class _GradientPulseButtonState extends State<GradientPulseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.pulseDuration,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 4, end: 12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (_, __) {
        return GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            decoration: BoxDecoration(
              gradient: GradientX.linear(
                colors: widget.colors,
                angle: 45,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: [
                BoxShadow(
                  color: widget.colors.last.withOpacity(0.6),
                  blurRadius: _glowAnimation.value,
                  spreadRadius: 1,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: widget.child,
          ),
        );
      },
    );
  }
}
