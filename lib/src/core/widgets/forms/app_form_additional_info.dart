import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormAdditionalInfo extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String? subtitle;

  const AppFormAdditionalInfo({
    super.key,
    required this.controller,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final effectiveTitle = title ?? t.app.additional_info_title;
    final effectiveSubtitle = subtitle ?? t.app.additional_info_subtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          effectiveTitle,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          effectiveSubtitle,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: t.app.additional_info_hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
            filled: true,
            fillColor: ColorName.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: ColorName.primary, width: 2.w),
            ),
            contentPadding: EdgeInsets.all(12.w),
          ),
        ),
      ],
    );
  }
}
