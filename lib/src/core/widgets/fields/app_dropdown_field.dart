import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class AppDropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const AppDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            closedFillColor: Colors.white,
            closedBorder: Border.all(color: Colors.grey.shade400),
            closedBorderRadius: BorderRadius.circular(8.r),
            expandedBorderRadius: BorderRadius.circular(8.r),
            listItemStyle: TextStyle(fontSize: 14.sp, color: Colors.black87),
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}
