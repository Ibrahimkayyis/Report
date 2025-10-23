import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'info_field_item.dart';

class InfoSectionCard extends StatelessWidget {
  final String title;
  final String editButtonLabel;
  final Map<String, String> fields;
  final VoidCallback? onEdit;

  const InfoSectionCard({
    super.key,
    required this.title,
    required this.editButtonLabel,
    required this.fields,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          // Stronger primary shadow for depth
          BoxShadow(
            color: ColorName.black.withOpacity(0.12),
            blurRadius: 24.r,
            spreadRadius: 1.r,
            offset: Offset(0, 6.h),
          ),
          // Secondary subtle shadow to give a crisp edge
          BoxShadow(
            color: ColorName.black.withOpacity(0.06),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Title and Edit Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorName.primary,
                ),
              ),
              
              GestureDetector(
                onTap: onEdit,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: ColorName.primary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        editButtonLabel,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorName.white,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.edit,
                        size: 14.sp,
                        color: ColorName.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),
          // Thin divider to separate header from content below
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300,
          ),

          SizedBox(height: 16.h),
          
          // Fields Grid (2 columns)
          _buildFieldsGrid(),
        ],
      ),
    );
  }

  Widget _buildFieldsGrid() {
    final fieldEntries = fields.entries.toList();
    final rows = <Widget>[];
    
    for (int i = 0; i < fieldEntries.length; i += 2) {
      final leftField = fieldEntries[i];
      final rightField = i + 1 < fieldEntries.length ? fieldEntries[i + 1] : null;
      
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InfoFieldItem(
                label: leftField.key,
                value: leftField.value,
              ),
            ),
            
            if (rightField != null) ...[
              SizedBox(width: 16.w),
              Expanded(
                child: InfoFieldItem(
                  label: rightField.key,
                  value: rightField.value,
                ),
              ),
            ] else
              const Spacer(),
          ],
        ),
      );
      
      if (i + 2 < fieldEntries.length) {
        rows.add(SizedBox(height: 16.h));
      }
    }
    
    return Column(
      children: rows,
    );
  }
}