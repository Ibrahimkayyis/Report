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

  // Selection Mode Properties
  final bool isSelectionMode;
  final bool isSelected;
  final VoidCallback onLongPress;
  final ValueChanged<bool?> onSelectChanged;
  
  // Navigation Callback
  final VoidCallback onTap;

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
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Styling dinamis
    final backgroundColor = isSelected 
        ? ColorName.primary.withOpacity(0.08) 
        : Colors.white;

    // Font Weight: Bold jika belum dibaca
    final titleWeight = isRead ? FontWeight.w600 : FontWeight.w800;
    
    // Warna teks
    final titleColor = isRead ? ColorName.textPrimary.withOpacity(0.7) : ColorName.textPrimary;
    
    // Border: Biru jika dipilih (Selection Mode)
    final borderColor = isSelected ? ColorName.primary : Colors.grey.shade200;

    return GestureDetector(
      onLongPress: onLongPress,
      onTap: () {
        if (isSelectionMode) {
          onSelectChanged(!isSelected);
        } else {
          onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.all(14.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox (Muncul saat mode seleksi)
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
                color: ColorName.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: ColorName.primary,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),

            /// 📝 Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row Atas: Judul & Waktu + Dot
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: titleWeight, // Bold jika unread
                            color: titleColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      
                      // Waktu & Dot Biru
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: isRead 
                                  ? Colors.grey.shade500 
                                  : ColorName.primary, // Waktu jadi biru jika unread
                              fontWeight: isRead ? FontWeight.normal : FontWeight.w600,
                            ),
                          ),
                          
                          // DOT BIRU (Indikator Belum Dibaca)
                          if (!isRead) ...[
                            SizedBox(height: 6.h),
                            Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: const BoxDecoration(
                                color: ColorName.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 4.h),
                  
                  // Deskripsi
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorName.textPrimary.withOpacity(0.7),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 8.h),
                  
                  // Badge Tipe Layanan / OPD (REVISI: KEMBALI KE BIRU)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: ColorName.primary, // ✅ Biru Solid
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      type.toUpperCase().replaceAll('_', ' '),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white, // ✅ Teks Putih
                        fontWeight: FontWeight.w600,
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