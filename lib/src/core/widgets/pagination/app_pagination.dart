import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

/// Widget global untuk pagination dengan tampilan identik seperti di HomeTeknisiScreen.
/// Mengatur tampilan UI pagination, tidak mengatur logika atau sumber data.
///
/// Gunakan di berbagai modul (RFC, Rating, Ticket, dsb).
class AppPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalData;
  final int startData;
  final int endData;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final ValueChanged<int>? onPageSelected;

  const AppPagination({
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
        /// Info teks — sama seperti di TeknisiPagination
        Text(
          '${t.app.dashboard.pagination_info} $startData ${t.app.dashboard.to} $endData ${t.app.dashboard.of_total} $totalData ${t.app.dashboard.data_label}',
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),

        /// Navigasi halaman
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol Previous
            _buildIconButton(
              context,
              icon: Icons.chevron_left,
              enabled: currentPage > 1,
              onTap: onPrevious,
            ),
            SizedBox(width: 8.w),

            /// Nomor halaman
            ..._buildPageNumbers(),

            SizedBox(width: 8.w),

            // Tombol Next
            _buildIconButton(
              context,
              icon: Icons.chevron_right,
              enabled: currentPage < totalPages,
              onTap: onNext,
            ),
          ],
        ),
      ],
    );
  }

  /// Tombol navigasi kiri/kanan
  Widget _buildIconButton(
    BuildContext context, {
    required IconData icon,
    required bool enabled,
    VoidCallback? onTap,
  }) {
    return IconButton(
      onPressed: enabled ? onTap : null,
      icon: Icon(icon, size: 18.sp),
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        padding: EdgeInsets.all(8.w),
      ),
      color: enabled ? ColorName.primary : Colors.grey.shade400,
    );
  }

  /// Daftar nomor halaman (maks 5)
  List<Widget> _buildPageNumbers() {
    final List<Widget> pages = [];
    final start = (currentPage - 2 > 0) ? currentPage - 2 : 1;
    final end = (start + 4 <= totalPages) ? start + 4 : totalPages;

    for (int page = start; page <= end; page++) {
      final isActive = page == currentPage;
      pages.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: GestureDetector(
            onTap: () => onPageSelected?.call(page),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isActive ? ColorName.primary : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                '$page',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isActive ? ColorName.white : Colors.grey.shade700,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return pages;
  }
}
