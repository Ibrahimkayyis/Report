import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/gen/colors.gen.dart';

class FontSizeSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const FontSizeSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final fontScales = [0.8, 1.0, 1.2];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.font_size,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          t.app.font_size_subtitle,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (i) {
              final isSelected = selectedIndex == i;
              return GestureDetector(
                onTap: () => onChanged(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  padding: EdgeInsets.all(isSelected ? 10.w : 8.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? ColorName.primary.withValues(alpha:0.1) : Colors.transparent,
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontSize: (18.sp * fontScales[i]),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                      color: isSelected ? ColorName.textPrimary : Colors.grey.shade500,
                    ),
                    child: const Text("Aa"),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
