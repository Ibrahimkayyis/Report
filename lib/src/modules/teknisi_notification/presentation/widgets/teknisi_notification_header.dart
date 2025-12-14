import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiNotificationHeader extends StatelessWidget {
  final VoidCallback onRefresh;
  final VoidCallback onDeleteMode;
  final VoidCallback onMarkAllRead;
  final ValueChanged<String> onFilterChanged;
  final String currentFilter;

  const TeknisiNotificationHeader({
    super.key,
    required this.onRefresh,
    required this.onDeleteMode,
    required this.onMarkAllRead,
    required this.onFilterChanged,
    required this.currentFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- FILTER CHIPS SECTION ---
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown, 
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  _buildFilterChip("Semua", "all"),
                  SizedBox(width: 6.w), 
                  _buildFilterChip("Belum Dibaca", "unread"),
                  SizedBox(width: 6.w),
                  _buildFilterChip("Sudah Dibaca", "read"),
                ],
              ),
            ),
          ),

          SizedBox(width: 8.w),

          // --- MENU BUTTON ---
          Container(
            height: 36.w,
            width: 36.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              tooltip: "Opsi Lain",
              offset: const Offset(0, 40),
              onSelected: (value) {
                if (value == 'refresh') onRefresh();
                if (value == 'mark_all') onMarkAllRead();
                if (value == 'delete') onDeleteMode();
              },
              icon: Icon(Icons.more_vert, color: Colors.grey.shade700, size: 20.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'refresh',
                  child: Row(
                    children: [
                      Icon(Icons.refresh, size: 18, color: Colors.black54),
                      SizedBox(width: 8),
                      Text("Refresh"),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'mark_all',
                  child: Row(
                    children: [
                      Icon(Icons.done_all, size: 18, color: Colors.black54),
                      SizedBox(width: 8),
                      Text("Tandai Dibaca"),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline, size: 18, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Hapus", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final bool isActive = currentFilter == value;

    return GestureDetector(
      onTap: () => onFilterChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? ColorName.primary : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isActive ? ColorName.primary : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: ColorName.primary.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}