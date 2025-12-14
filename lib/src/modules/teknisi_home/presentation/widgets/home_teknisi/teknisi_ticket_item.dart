import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';

class TeknisiTicketItem extends StatelessWidget {
  final TeknisiTicketModel ticket;
  final VoidCallback? onEditPressed;
  final VoidCallback? onRFCPressed; // ✅ Callback untuk RFC
  final bool isReportingTab; // ✅ Flag untuk cek tab Pelaporan

  const TeknisiTicketItem({
    super.key,
    required this.ticket,
    this.onEditPressed,
    this.onRFCPressed,
    this.isReportingTab = false, // Default false (Pelayanan)
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isDraft = ticket.statusTeknisi.toLowerCase() == 'draft';

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Header (User Info & Status)
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: ticket.creator.profileUrl != null
                    ? NetworkImage(ticket.creator.profileUrl!)
                    : NetworkImage(
                        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(ticket.creator.fullName)}&background=random'),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket.creator.fullName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      ticket.createdAt.split('T')[0],
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
                  ticket.statusTeknisi,
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
              _buildInfoChip(
                t.app.dashboard.ticket_category,
                ticket.asset?.kategori ?? '-',
              ),
              _buildInfoChip(
                t.app.dashboard.ticket_type,
                ticket.asset?.jenisAsset ?? '-',
              ),
              _buildInfoChip(
                "Prioritas",
                ticket.priority,
              ),
              _buildInfoChip(
                t.app.dashboard.ticket_attachment,
                '${ticket.files.length}',
                icon: Icons.description_outlined,
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔹 Buttons (Edit + RFC jika tab Pelaporan)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ✅ Button RFC (hanya muncul di tab Pelaporan)
              if (isReportingTab) ...[
                ElevatedButton.icon(
                  onPressed: onRFCPressed,
                  icon: Icon(Icons.change_circle_outlined, size: 16.sp),
                  label: const Text('Buat RFC'),
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
                SizedBox(width: 8.w),
              ],
              
              // ✅ Button Edit (selalu ada)
              ElevatedButton.icon(
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
            ],
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