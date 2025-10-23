import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/assets.gen.dart';

class ThemePreferenceSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ThemePreferenceSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final List<Map<String, dynamic>> themes = [
      {
        'label': t.app.system,
        'image': Assets.images.themeSystem.path,
      },
      {
        'label': t.app.light,
        'image': Assets.images.themeLight.path,
      },
      {
        'label': t.app.dark,
        'image': Assets.images.themeDark.path,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title
        Text(
          t.app.theme_preference,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),

        // 🔹 Subtitle
        Text(
          t.app.theme_preference_subtitle,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 12.h),

        // 🔹 Pilihan tema
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(themes.length, (i) {
            final isSelected = selectedIndex == i;

            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔸 Image container dengan border
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected ? ColorName.primary : Colors.grey.shade300,
                          width: isSelected ? 2.w : 1.w,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: ColorName.primary.withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: AnimatedScale(
                        scale: isSelected ? 1.08 : 1.0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                        child: Image.asset(
                          themes[i]['image'],
                          height: 60.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // 🔸 Text + Check icon sejajar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          themes[i]['label'],
                          style: TextStyle(
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected
                                ? ColorName.textPrimary
                                : Colors.grey.shade700,
                            fontSize: 14.sp,
                          ),
                        ),
                        if (isSelected) ...[
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.check_circle,
                            color: ColorName.primary,
                            size: 16.sp,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
