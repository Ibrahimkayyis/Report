import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class KbSearchBar extends StatelessWidget {
  final bool isFocused;
  final double containerWidth;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onFocusTap;

  const KbSearchBar({
    super.key,
    required this.isFocused,
    required this.containerWidth,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onFocusTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFocusTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: isFocused
              ? [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha:0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: StandardSearchBar(
          width: containerWidth.toDouble(),
          height: 48,
          borderRadius: 25,
          backgroundColor: Colors.grey.shade100,
          hintText: hintText,
          startIcon: Icons.search,
          startIconColor: Colors.grey.shade600,
          showStartIcon: true,
          startIconOnTap: onFocusTap,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          shadow: const [],
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: ColorName.textPrimary,
          ),
          suggestions: const [
            'Cara membuat tiket baru',
            'Cek status tiket',
            'Hubungi support',
            'Reset password',
            'Waktu penanganan tiket',
            'Belum mendapat respon',
          ],
        ),
      ),
    );
  }
}
