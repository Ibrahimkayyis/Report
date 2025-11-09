import 'package:flutter/material.dart';
import 'package:report/gen/colors.gen.dart';

/// Alternative geometric design for register screen
/// Vertical arrangement for scrollable content
class RegisterBackgroundGeometricPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Top left triangle
    final paint1 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.12)
      ..style = PaintingStyle.fill;

    final topTriangle = Path();
    topTriangle.moveTo(0, 0);
    topTriangle.lineTo(size.width * 0.5, 0);
    topTriangle.lineTo(0, size.height * 0.3);
    topTriangle.close();
    canvas.drawPath(topTriangle, paint1);

    // Top right rounded rectangle
    final paint2 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    final topRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.65,
        0,
        size.width * 0.35,
        size.height * 0.2,
      ),
      Radius.circular(size.width * 0.08),
    );
    canvas.drawRRect(topRRect, paint2);

    // Middle left circle
    final paint3 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.06)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.45),
      size.width * 0.2,
      paint3,
    );

    // Middle right rounded rectangle
    final paint4 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.07)
      ..style = PaintingStyle.fill;

    final midRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.7,
        size.height * 0.5,
        size.width * 0.3,
        size.height * 0.15,
      ),
      Radius.circular(size.width * 0.08),
    );
    canvas.drawRRect(midRRect, paint4);

    // Bottom right triangle
    final paint5 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.10)
      ..style = PaintingStyle.fill;

    final bottomTriangle = Path();
    bottomTriangle.moveTo(size.width, size.height);
    bottomTriangle.lineTo(size.width * 0.5, size.height);
    bottomTriangle.lineTo(size.width, size.height * 0.7);
    bottomTriangle.close();
    canvas.drawPath(bottomTriangle, paint5);

    // Bottom left rounded rectangle
    final paint6 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    final bottomRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        size.height * 0.8,
        size.width * 0.35,
        size.height * 0.2,
      ),
      Radius.circular(size.width * 0.08),
    );
    canvas.drawRRect(bottomRRect, paint6);

    // Bottom center small circle
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.92),
      size.width * 0.12,
      paint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}