import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class AppDropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? errorText;
  final bool showLabelAbove; // ✅ NEW PARAMETER

  const AppDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.errorText,
    this.showLabelAbove = true, // Default tetap muncul diatas (agar tidak merusak screen lain)
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Logic untuk menyembunyikan label di atas
        if (showLabelAbove) ...[
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorName.textPrimary,
            ),
          ),
          SizedBox(height: 6.h),
        ],
        
        CustomDropdown<String>(
          hintText: label, // Label akan muncul di sini sebagai hint
          items: items,
          initialItem: value,
          onChanged: onChanged,
          decoration: CustomDropdownDecoration(
            closedFillColor: ColorName.white,
            closedBorder: Border.all(
              color: hasError ? Colors.red : ColorName.black.withValues(alpha: 0.2),
              width: hasError ? 2 : 1,
            ),
            closedBorderRadius: BorderRadius.circular(10.r), // Menyesuaikan style header sebelumnya
            expandedBorderRadius: BorderRadius.circular(10.r),
            listItemStyle: TextStyle(fontSize: 14.sp, color: ColorName.black),
            hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600), // Font size disesuaikan header
            headerStyle: TextStyle(fontSize: 12.sp, color: ColorName.textPrimary),
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
                  style: TextStyle(fontSize: 12.sp, color: Colors.red, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}