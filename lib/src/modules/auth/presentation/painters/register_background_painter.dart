import 'package:flutter/material.dart';
import 'package:report/gen/colors.gen.dart';

/// Custom painter for decorative background on register screen
/// Wave design with layered curves - optimized for scrollable content
class RegisterBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.15)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.10)
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = ColorName.primary.withValues(alpha:0.08)
      ..style = PaintingStyle.fill;

    // Top Wave 1 (primary)
    final topWave1 = Path();
    topWave1.moveTo(0, 0);
    topWave1.lineTo(0, size.height * 0.22);
    topWave1.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.27,
      size.width * 0.5,
      size.height * 0.22,
    );
    topWave1.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.17,
      size.width,
      size.height * 0.22,
    );
    topWave1.lineTo(size.width, 0);
    topWave1.close();

    // Top Wave 2 (secondary, above primary)
    final topWave2 = Path();
    topWave2.moveTo(0, 0);
    topWave2.lineTo(0, size.height * 0.15);
    topWave2.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.18,
      size.width * 0.6,
      size.height * 0.15,
    );
    topWave2.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.13,
      size.width,
      size.height * 0.16,
    );
    topWave2.lineTo(size.width, 0);
    topWave2.close();

    // Middle Wave (subtle accent)
    final middleWave = Path();
    middleWave.moveTo(0, size.height * 0.48);
    middleWave.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.45,
      size.width * 0.4,
      size.height * 0.48,
    );
    middleWave.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.51,
      size.width * 0.8,
      size.height * 0.48,
    );
    middleWave.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.46,
      size.width,
      size.height * 0.48,
    );
    middleWave.lineTo(size.width, size.height * 0.55);
    middleWave.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.53,
      size.width * 0.6,
      size.height * 0.55,
    );
    middleWave.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.57,
      size.width * 0.2,
      size.height * 0.55,
    );
    middleWave.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.54,
      0,
      size.height * 0.55,
    );
    middleWave.close();

    // Bottom Wave 1 (primary)
    final bottomWave1 = Path();
    bottomWave1.moveTo(0, size.height);
    bottomWave1.lineTo(0, size.height * 0.78);
    bottomWave1.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.73,
      size.width * 0.5,
      size.height * 0.78,
    );
    bottomWave1.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.83,
      size.width,
      size.height * 0.78,
    );
    bottomWave1.lineTo(size.width, size.height);
    bottomWave1.close();

    // Bottom Wave 2 (secondary, below primary)
    final bottomWave2 = Path();
    bottomWave2.moveTo(0, size.height);
    bottomWave2.lineTo(0, size.height * 0.85);
    bottomWave2.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.82,
      size.width * 0.6,
      size.height * 0.85,
    );
    bottomWave2.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.87,
      size.width,
      size.height * 0.84,
    );
    bottomWave2.lineTo(size.width, size.height);
    bottomWave2.close();

    // Draw all waves in order (back to front)
    canvas.drawPath(bottomWave1, paint1);
    canvas.drawPath(topWave1, paint1);
    canvas.drawPath(middleWave, paint3);
    canvas.drawPath(bottomWave2, paint2);
    canvas.drawPath(topWave2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}