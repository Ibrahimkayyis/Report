import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class AppFormCategorySelector extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const AppFormCategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final categories = [
      t.app.report_category_hardware,
      t.app.report_category_software,
      t.app.report_category_network,
      t.app.report_category_email,
      t.app.report_category_security,
      t.app.report_category_other,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.app.report_reason_question,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          t.app.select_one,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),

        /// 🔹 Grid layout (2 items per row)
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 3.5,
          physics: const NeverScrollableScrollPhysics(),
          children: categories.map((category) {
            final isSelected = selectedCategory == category;
            return Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () => onCategorySelected(category),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: isSelected ? ColorName.primary : ColorName.background,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isSelected
                          ? ColorName.primary
                          : Colors.grey.shade300,
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      category,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.5.sp,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected
                            ? ColorName.onPrimary
                            : ColorName.textPrimary,
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
