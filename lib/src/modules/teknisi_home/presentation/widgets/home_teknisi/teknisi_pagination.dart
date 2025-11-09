import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart'; // ✅ import translation

class TeknisiPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalData;
  final int startData;
  final int endData;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final ValueChanged<int>? onPageSelected;

  const TeknisiPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.totalData,
    required this.startData,
    required this.endData,
    this.onPrevious,
    this.onNext,
    this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Column(
      children: [
        Text(
          // ✅ gunakan interpolation langsung
          '${t.app.dashboard.pagination_info} $startData ${t.app.dashboard.to} $endData ${t.app.dashboard.of_total} $totalData ${t.app.dashboard.data_label}',
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: currentPage > 1 ? onPrevious : null,
              icon: Icon(Icons.chevron_left, size: 18.sp),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding: EdgeInsets.all(8.w),
              ),
            ),
            SizedBox(width: 8.w),

            // Halaman
            ...List.generate(totalPages, (i) {
              final page = i + 1;
              final isActive = page == currentPage;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GestureDetector(
                  onTap: () => onPageSelected?.call(page),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isActive ? ColorName.primary : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '$page',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color:
                            isActive ? ColorName.white : Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              );
            }),

            SizedBox(width: 8.w),
            IconButton(
              onPressed: currentPage < totalPages ? onNext : null,
              icon: Icon(Icons.chevron_right, size: 18.sp),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding: EdgeInsets.all(8.w),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
