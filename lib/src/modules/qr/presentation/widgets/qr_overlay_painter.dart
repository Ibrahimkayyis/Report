import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Painter untuk menggambar overlay gelap dan hanya corner guides
class QROverlayPainter extends CustomPainter {
  final double frameSize;
  final Color cornerColor;
  final double cornerLength;
  final double cornerThickness;

  QROverlayPainter({
    this.frameSize = 250.0,
    required this.cornerColor,
    this.cornerLength = 28.0,
    this.cornerThickness = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1) fill seluruh layar dengan overlay gelap semi-transparent
    final Paint overlayPaint = Paint()
      ..color = Colors.black.withOpacity(0.45)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), overlayPaint);

    // 2) corner guides (L-shaped) di tengah frame
    final Paint cornerPaint = Paint()
      ..color = cornerColor
      ..strokeWidth = cornerThickness.w
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double left = (size.width - frameSize) / 2;
    final double top = (size.height - frameSize) / 2;
    final double right = left + frameSize;
    final double bottom = top + frameSize;

    final double len = cornerLength.w;
    // kiri atas
    canvas.drawLine(Offset(left, top + len), Offset(left, top), cornerPaint);
    canvas.drawLine(Offset(left, top), Offset(left + len, top), cornerPaint);
    // kanan atas
    canvas.drawLine(Offset(right - len, top), Offset(right, top), cornerPaint);
    canvas.drawLine(Offset(right, top), Offset(right, top + len), cornerPaint);
    // kiri bawah
    canvas.drawLine(Offset(left, bottom - len), Offset(left, bottom), cornerPaint);
    canvas.drawLine(Offset(left, bottom), Offset(left + len, bottom), cornerPaint);
    // kanan bawah
    canvas.drawLine(Offset(right - len, bottom), Offset(right, bottom), cornerPaint);
    canvas.drawLine(Offset(right, bottom - len), Offset(right, bottom), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
