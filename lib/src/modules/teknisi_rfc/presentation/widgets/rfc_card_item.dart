import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/teknisi_rfc/presentation/widgets/rfc_status_badge.dart';

class RFCCardItem extends StatelessWidget {
  final String documentName;
  final String dateSent;
  final String status;
  final VoidCallback? onEditPressed;
  final bool isDraft; // ✅ Parameter baru

  const RFCCardItem({
    super.key,
    required this.documentName,
    required this.dateSent,
    required this.status,
    this.onEditPressed,
    required this.isDraft, // ✅ Wajib diisi
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Tentukan Icon & Warna berdasarkan isDraft
    final IconData actionIcon =
        isDraft ? Icons.edit_outlined : Icons.remove_red_eye_outlined;
    
    final Color actionIconColor =
        isDraft ? ColorName.primary : Colors.grey.shade700;
        
    final Color actionBgColor =
        isDraft ? ColorName.primary.withValues(alpha: 0.1) : Colors.grey.shade100;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header: Document name + Status badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Document icon + name
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: ColorName.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.description_outlined,
                          color: ColorName.primary,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          documentName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.textPrimary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),

                /// Status badge
                RFCStatusBadge(status: status),
              ],
            ),

            SizedBox(height: 16.h),

            /// Date sent info & Action Button
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16.sp,
                  color: Colors.grey.shade600,
                ),
                SizedBox(width: 8.w),
                Text(
                  dateSent,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),

                /// ✅ Action Button (Edit / View)
                InkWell(
                  onTap: onEditPressed,
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: actionBgColor, // Warna dinamis
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      actionIcon, // Icon dinamis
                      color: actionIconColor, // Warna icon dinamis
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}