import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormProblemDescription extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final String? errorText;
  
  // ✅ NEW: Tambahkan parameter callback ini
  final ValueChanged<String>? onChanged; 

  const AppFormProblemDescription({
    super.key,
    required this.controller,
    this.title,
    this.hint,
    this.errorText,
    
    // ✅ NEW: Masukkan ke constructor
    this.onChanged, 
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final effectiveTitle = title ?? t.app.problem_description_question;
    final effectiveHint = hint ?? t.app.problem_description_hint;
    final hasError = errorText != null && errorText!.isNotEmpty;

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
          
          // ✅ NEW: Sambungkan parameter ke TextField
          onChanged: onChanged, 
          
          decoration: InputDecoration(
            hintText: t.app.additional_info_hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
            filled: true,
            fillColor: ColorName.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : Colors.grey.shade300,
                width: hasError ? 2 : 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : Colors.grey.shade300,
                width: hasError ? 2 : 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : ColorName.primary,
                width: 2.w,
              ),
            ),
            contentPadding: EdgeInsets.all(12.w),
          ),
        ),
        
        // Error Text Section
        if (hasError) ...[
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(
                Icons.error_outline,
                size: 14.sp,
                color: Colors.red,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  errorText!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}