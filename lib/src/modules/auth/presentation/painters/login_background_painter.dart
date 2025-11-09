import 'package:flutter/material.dart';
import 'package:report/gen/colors.gen.dart';

/// Custom painter for decorative wave background on login screen
class LoginBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.15)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.1)
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    // First wave (top)
    final path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(0, size.height * 0.25);
    path1.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.5,
      size.height * 0.25,
    );
    path1.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );
    path1.lineTo(size.width, 0);
    path1.close();

    // Second wave (middle)
    final path2 = Path();
    path2.moveTo(0, size.height * 0.15);
    path2.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.20,
      size.width * 0.6,
      size.height * 0.15,
    );
    path2.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.12,
      size.width,
      size.height * 0.18,
    );
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();

    // Third wave (bottom)
    final path3 = Path();
    path3.moveTo(0, size.height);
    path3.lineTo(0, size.height * 0.75);
    path3.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.70,
      size.width * 0.5,
      size.height * 0.75,
    );
    path3.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.80,
      size.width,
      size.height * 0.75,
    );
    path3.lineTo(size.width, size.height);
    path3.close();

    // Draw all waves
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}