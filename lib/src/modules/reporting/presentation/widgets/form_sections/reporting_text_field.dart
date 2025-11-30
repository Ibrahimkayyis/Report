import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class ReportingTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool readOnly;

  const ReportingTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.errorText,
    this.onChanged,
    this.maxLines = 1,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          onChanged: onChanged,
          maxLines: maxLines,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 14.sp,
            color: readOnly ? Colors.grey.shade700 : ColorName.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
            filled: true,
            // Warna berbeda jika readOnly
            fillColor: readOnly ? Colors.grey.shade100 : ColorName.white,
            contentPadding: EdgeInsets.all(14.w),
            border: _border(hasError),
            enabledBorder: _border(hasError),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : ColorName.primary,
                width: 2,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.error_outline, size: 14.sp, color: Colors.red),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  errorText!,
                  style: TextStyle(fontSize: 12.sp, color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  OutlineInputBorder _border(bool hasError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: hasError ? Colors.red : Colors.grey.shade400,
        width: hasError ? 2 : 1,
      ),
    );
  }
}