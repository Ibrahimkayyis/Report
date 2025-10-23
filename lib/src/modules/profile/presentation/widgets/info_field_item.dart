// lib/src/modules/profile/presentation/widgets/info_field_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class InfoFieldItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoFieldItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp, // Reduced from 13sp
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        
        SizedBox(height: 4.h),
        
        Text(
          value,
          style: TextStyle(
            fontSize: 10.sp, // Reduced from 14sp
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}