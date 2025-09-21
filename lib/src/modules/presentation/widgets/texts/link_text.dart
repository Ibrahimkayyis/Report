import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

/// Text dengan bagian clickable (link).
/// Contoh: "Already have account? Login"
class LinkText extends StatelessWidget {
  final String leadingText;
  final String linkText;
  final VoidCallback onTap;
  final Color? linkColor;

  const LinkText({
    super.key,
    required this.leadingText,
    required this.linkText,
    required this.onTap,
    this.linkColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorName.textPrimary,
          ),
          children: [
            TextSpan(text: leadingText),
            const TextSpan(text: ' '),
            TextSpan(
              text: linkText,
              style: TextStyle(
                color: linkColor ?? ColorName.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
