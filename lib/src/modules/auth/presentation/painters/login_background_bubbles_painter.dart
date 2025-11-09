import 'package:flutter/material.dart';
import 'package:report/gen/colors.gen.dart';

/// Alternative Custom painter with circular bubbles design for login screen
class LoginBackgroundBubblesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Large circle - top right
    final paint1 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.12)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.1),
      size.width * 0.35,
      paint1,
    );

    // Medium circle - top left
    final paint2 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.15),
      size.width * 0.25,
      paint2,
    );

    // Large circle - bottom left
    final paint3 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.10)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.88),
      size.width * 0.4,
      paint3,
    );

    // Medium circle - bottom right
    final paint4 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.07)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.85),
      size.width * 0.3,
      paint4,
    );

    // Small circle - middle right
    final paint5 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.06)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.5),
      size.width * 0.2,
      paint5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}