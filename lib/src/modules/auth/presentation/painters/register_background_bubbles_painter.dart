import 'package:flutter/material.dart';
import 'package:report/gen/colors.gen.dart';

/// Alternative bubbles design for register screen
/// More scattered bubbles for longer scrollable content
class RegisterBackgroundBubblesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Top section bubbles
    final paint1 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.12)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.08),
      size.width * 0.22,
      paint1,
    );

    final paint2 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.12),
      size.width * 0.28,
      paint2,
    );

    // Middle section bubbles
    final paint3 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.06)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.4),
      size.width * 0.18,
      paint3,
    );

    canvas.drawCircle(
      Offset(size.width * 0.92, size.height * 0.5),
      size.width * 0.2,
      paint3,
    );

    // Bottom section bubbles
    final paint4 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.10)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.85),
      size.width * 0.32,
      paint4,
    );

    final paint5 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.07)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.9),
      size.width * 0.25,
      paint5,
    );

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.95),
      size.width * 0.15,
      paint5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}