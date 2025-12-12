import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;
  final VoidCallback onViewHistory;
  final VoidCallback? onRate;   // Nullable
  final VoidCallback? onReopen; // Nullable

  const ActivityItem({
    super.key,
    required this.activity,
    required this.onViewHistory,
    this.onRate,
    this.onReopen,
  });

  String _formatDate(String dateString) {
    try {
      if (dateString.contains('T')) {
        return dateString.split('T').first;
      }
      return dateString;
    } catch (_) {
      return dateString;
    }
  }

  Color _getStatusColor(String status) {
    final s = status.toLowerCase();
    if (s == 'selesai') return Colors.green;
    if (s.contains('tolak') || s == 'rejected') return Colors.red;
    if (s.contains('reopen')) return Colors.orange;
    return ColorName.primary;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(activity.status);
    // Cek apakah data rating ada di model
    final isRated = activity.rating != null;

    final displayId = activity.ticketCode.isNotEmpty 
        ? activity.ticketCode 
        : "ID: ${activity.id.substring(0, 8)}...";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                displayId,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: statusColor.withOpacity(0.2)),
                ),
                child: Text(
                  activity.status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12.h),

          // 2. Judul
          Text(
            activity.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 4.h),

          // 3. Tanggal
          if (activity.workEndDate != null)
            Text(
              "Selesai: ${_formatDate(activity.workEndDate!)}",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade500,
              ),
            ),

          SizedBox(height: 16.h),
          Divider(height: 1.h, color: Colors.grey.shade200),
          SizedBox(height: 12.h),

          // 4. Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Detail (Always Show)
              _buildActionButton(
                label: "Detail",
                icon: Icons.visibility_outlined,
                color: Colors.grey.shade700,
                onTap: onViewHistory,
              ),

              // Reopen (Jika Valid)
              if (onReopen != null) ...[
                SizedBox(width: 8.w),
                _buildActionButton(
                  label: "Ajukan Lagi",
                  icon: Icons.refresh,
                  color: Colors.orange,
                  onTap: onReopen!,
                ),
              ],

              // Rating (Jika Valid)
              if (onRate != null) ...[
                SizedBox(width: 8.w),
                _buildActionButton(
                  label: "Nilai",
                  icon: Icons.star_border,
                  color: ColorName.primary,
                  onTap: onRate!,
                  isPrimary: true,
                ),
              ] 
              // Jika sudah rating (data ada di model), tampilkan indikator
              else if (isRated) ...[
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.amber.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "${activity.rating!.rating}/5",
                        style: TextStyle(
                          fontSize: 12.sp, 
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade900
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return Material(
      color: isPrimary ? color : Colors.transparent,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: isPrimary ? null : Border.all(color: color.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: isPrimary ? Colors.white : color,
              ),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? Colors.white : color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}