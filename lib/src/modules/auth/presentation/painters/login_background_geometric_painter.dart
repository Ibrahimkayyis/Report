import 'package:flutter/material.dart';
import 'package:report/gen/colors.gen.dart';

/// Alternative Custom painter with geometric shapes design for login screen
class LoginBackgroundGeometricPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Top triangle
    final paint1 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.12)
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(size.width * 0.6, 0);
    path1.lineTo(0, size.height * 0.35);
    path1.close();
    canvas.drawPath(path1, paint1);

    // Top right rounded rectangle
    final paint2 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.7,
        0,
        size.width * 0.3,
        size.height * 0.25,
      ),
      Radius.circular(size.width * 0.1),
    );
    canvas.drawRRect(rrect, paint2);

    // Bottom triangle
    final paint3 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.10)
      ..style = PaintingStyle.fill;

    final path3 = Path();
    path3.moveTo(size.width, size.height);
    path3.lineTo(size.width * 0.4, size.height);
    path3.lineTo(size.width, size.height * 0.65);
    path3.close();
    canvas.drawPath(path3, paint3);

    // Bottom left rounded rectangle
    final paint4 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.07)
      ..style = PaintingStyle.fill;

    final rrect2 = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        size.height * 0.75,
        size.width * 0.3,
        size.height * 0.25,
      ),
      Radius.circular(size.width * 0.1),
    );
    canvas.drawRRect(rrect2, paint4);

    // Center circle
    final paint5 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.05)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.5),
      size.width * 0.15,
      paint5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}