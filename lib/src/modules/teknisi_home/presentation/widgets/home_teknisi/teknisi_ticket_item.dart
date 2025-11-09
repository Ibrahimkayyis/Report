import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class TeknisiTicketItem extends StatelessWidget {
  final String userName;
  final String date;
  final String status;
  final String kategori;
  final String jenis;
  final String bentuk;
  final int lampiranCount;
  final bool isDraft;
  final VoidCallback? onEditPressed; // ✅ hanya edit

  const TeknisiTicketItem({
    super.key,
    required this.userName,
    required this.date,
    required this.status,
    required this.kategori,
    required this.jenis,
    required this.bentuk,
    required this.lampiranCount,
    required this.isDraft,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Header
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?u=$userName'),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isDraft ? Colors.grey.shade400 : Colors.orange.shade400,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.white,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔹 Info Chips
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildInfoChip(t.app.dashboard.ticket_category, kategori),
              _buildInfoChip(t.app.dashboard.ticket_type, jenis),
              _buildInfoChip(t.app.dashboard.ticket_form, bentuk),
              _buildInfoChip(
                t.app.dashboard.ticket_attachment,
                '$lampiranCount',
                icon: Icons.description_outlined,
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔹 Button Edit Saja
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: onEditPressed,
              icon: Icon(Icons.edit_outlined, size: 16.sp),
              label: Text(t.app.dashboard.edit),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.primary,
                foregroundColor: ColorName.white,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                textStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, String value, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14.sp, color: ColorName.primary),
            SizedBox(width: 4.w),
          ],
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
