import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  final bool enableShake; // Control whether the widget shakes or not
  final Widget child; // Custom child widget
  final Duration duration; // Animation duration

  const ShakeWidget({
    super.key,
    required this.enableShake,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _offsetAnimation = Tween<double>(begin: 0.0, end: 24.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });

    // Automatically start shaking if enabled
    if (widget.enableShake) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void didUpdateWidget(covariant ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Start or stop the animation based on `enableShake`
    if (widget.enableShake && !_controller.isAnimating) {
      _controller.forward(from: 0.0);
    } else if (!widget.enableShake) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) => Transform.translate(
        offset: Offset(_offsetAnimation.value, 0.0),
        child: child,
      ),
      child: widget.child,
    );
  }
}
