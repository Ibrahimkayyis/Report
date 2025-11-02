import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const AppSectionTitle({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorName.background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.08),
            blurRadius: 12.r,
            spreadRadius: 1.r,
            offset: Offset(0, 4.h),
          ),
          BoxShadow(
            color: ColorName.black.withOpacity(0.04),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor ?? ColorName.primary,
        ),
      ),
    );
  }
}