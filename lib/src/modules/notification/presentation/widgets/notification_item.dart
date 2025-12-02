import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String type;
  final String time;
  final bool isRead;
  final IconData icon;

  // ✅ Selection Mode Properties
  final bool isSelectionMode;
  final bool isSelected;
  final VoidCallback onLongPress;
  final ValueChanged<bool?> onSelectChanged;
  
  // ✅ Navigation Callback (Tambahan untuk pindah ke Detail)
  final VoidCallback? onTap;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.type,
    required this.time,
    this.isRead = false,
    required this.icon,
    required this.isSelectionMode,
    required this.isSelected,
    required this.onLongPress,
    required this.onSelectChanged,
    this.onTap, // ✅ Initialize
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress, // Trigger selection mode
      onTap: () {
        if (isSelectionMode) {
          // 1. Jika sedang mode hapus -> Toggle Checkbox
          onSelectChanged(!isSelected);
        } else {
          // 2. Jika mode biasa -> Navigasi ke Detail (jika ada callback)
          onTap?.call();
        }
      },
      child: Container(
        padding: EdgeInsets.all(14.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: isRead ? ColorName.white : ColorName.primary.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border.all(color: ColorName.primary, width: 1.5)
              : Border.all(color: Colors.transparent),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Checkbox dengan animasi slide
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelectionMode ? 32.w : 0,
              padding: EdgeInsets.only(right: 8.w),
              child: isSelectionMode
                  ? Checkbox(
                      value: isSelected,
                      onChanged: onSelectChanged,
                      activeColor: ColorName.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    )
                  : null,
            ),

            /// 🔵 Icon
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: ColorName.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: ColorName.onPrimary,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),

            /// 📝 Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorName.textPrimary.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorName.textPrimary.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: ColorName.primary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: ColorName.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}