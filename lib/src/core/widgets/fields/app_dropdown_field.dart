import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class AppDropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? errorText; // ✅ NEW PARAMETER

  const AppDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.errorText, // ✅ NEW PARAMETER
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
            fontWeight: FontWeight.w500,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        CustomDropdown<String>(
          hintText: label,
          items: items,
          initialItem: value,
          onChanged: onChanged,
          decoration: CustomDropdownDecoration(
            closedFillColor: ColorName.white,
            closedBorder: Border.all(
              color: hasError ? Colors.red : Colors.grey.shade400, // ✅ Red border on error
              width: hasError ? 2 : 1, // ✅ Thicker border on error
            ),
            closedBorderRadius: BorderRadius.circular(8.r),
            expandedBorderRadius: BorderRadius.circular(8.r),
            listItemStyle: TextStyle(fontSize: 14.sp, color: ColorName.black),
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
          ),
        ),
        // ✅ ERROR TEXT
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