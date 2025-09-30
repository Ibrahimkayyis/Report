import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class ReportingFormPriorityLevel extends StatelessWidget {
  final String? selectedPriority;
  final ValueChanged<String> onPrioritySelected;

  const ReportingFormPriorityLevel({
    super.key,
    required this.selectedPriority,
    required this.onPrioritySelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final priorities = [
      {'label': t.app.priority_high, 'color': Colors.red},
      {'label': t.app.priority_medium, 'color': Colors.orange},
      {'label': t.app.priority_low, 'color': Colors.green},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.priority_level_title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          t.app.priority_level_subtitle,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),
        Row(
          children: priorities.map((priority) {
            final label = priority['label'] as String;
            final color = priority['color'] as Color;
            final isSelected = selectedPriority == label;

            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: priorities.last == priority ? 0 : 8.w,
                ),
                child: GestureDetector(
                  onTap: () => onPrioritySelected(label),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: isSelected ? color : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: isSelected ? color : color.withOpacity(0.5),
                        width: isSelected ? 2.w : 1.w,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: isSelected ? Colors.white : color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
