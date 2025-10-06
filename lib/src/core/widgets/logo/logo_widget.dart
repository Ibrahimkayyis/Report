import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';

/// Widget untuk menampilkan logo REPORT.
/// Bisa dipakai di SplashScreen maupun Auth Screens.
///
/// [showText] : jika true, menampilkan REPORT_TEXT.png di bawah logo.
/// [logoSize] : ukuran logo utama (default 80.w).
/// [textWidth] : lebar gambar teks REPORT (default 120.w).
class LogoWidget extends StatelessWidget {
  final bool showText;
  final double? logoSize;
  final double? textWidth;

  const LogoWidget({
    super.key,
    this.showText = false,
    this.logoSize,
    this.textWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo REPORT
        Image.asset(
          Assets.images.reportLogo.path,
          width: logoSize ?? 80.w,
          height: logoSize ?? 80.w,
          fit: BoxFit.contain,
          semanticLabel: 'REPORT Logo',
        ),

        if (showText) ...[
          SizedBox(height: 12.h),
          Image.asset(
            Assets.images.reportText.path,
            width: textWidth ?? 120.w,
            fit: BoxFit.contain,
            semanticLabel: 'REPORT Text',
          ),
        ],
      ],
    );
  }
}
