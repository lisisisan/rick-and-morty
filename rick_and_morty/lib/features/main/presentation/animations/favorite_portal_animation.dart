import 'dart:async';
import 'package:flutter/material.dart';

class FavoritePortalAnimation extends StatefulWidget {
  final Offset tapPosition;
  final VoidCallback onComplete;

  const FavoritePortalAnimation({
    super.key,
    required this.tapPosition,
    required this.onComplete,
  });

  @override
  State<FavoritePortalAnimation> createState() =>
      _FavoritePortalAnimationState();
}

class _FavoritePortalAnimationState extends State<FavoritePortalAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scale = Tween<double>(
      begin: 0.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

    // Уведомим, что анимация закончилась, через 700 мс
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) widget.onComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: PortalPainter(widget.tapPosition, _scale.value),
            );
          },
        ),
      ),
    );
  }
}

class PortalPainter extends CustomPainter {
  final Offset center;
  final double scale;

  PortalPainter(this.center, this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final double maxRadius = 40.0;
    final paint =
        Paint()
          ..shader = RadialGradient(
            colors: [
              const Color.fromARGB(215, 105, 240, 175),
              const Color.fromARGB(113, 105, 240, 175),
              Colors.transparent,
            ],
            stops: [0.0, 0.5, 1.0],
          ).createShader(
            Rect.fromCircle(center: center, radius: maxRadius * scale),
          );

    canvas.drawCircle(center, maxRadius * scale, paint);
  }

  @override
  bool shouldRepaint(covariant PortalPainter oldDelegate) =>
      oldDelegate.scale != scale;
}
