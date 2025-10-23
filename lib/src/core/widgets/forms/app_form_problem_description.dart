import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormProblemDescription extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;

  const AppFormProblemDescription({
    super.key,
    required this.controller,
    this.title,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final effectiveTitle = title ?? t.app.problem_description_question;
    final effectiveHint = hint ?? t.app.problem_description_hint;

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
          effectiveHint,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            // hintText: effectiveHint,
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
