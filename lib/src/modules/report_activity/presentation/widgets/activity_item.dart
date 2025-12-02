import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class ActivityItem extends StatelessWidget {
  final String id;
  final String title;
  final String completionDate;
  // Opsi Aksi (bisa null jika tidak tersedia untuk item tersebut)
  final VoidCallback? onViewHistory;
  final VoidCallback? onRate;
  final VoidCallback? onReopen;

  const ActivityItem({
    super.key,
    required this.id,
    required this.title,
    required this.completionDate,
    this.onViewHistory,
    this.onRate,
    this.onReopen,
  });

  @override
  Widget build(BuildContext context) {
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
          // 1. Baris Atas: ID & Tanggal Selesai
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ID: $id",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Selesai: $completionDate",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8.h),

          // 2. Judul Laporan (Bold)
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 12.h),

          // 3. Lampiran (Icon Placeholder sesuai gambar)
          Row(
            children: [
              Text(
                "Lampiran: ",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
              ),
              Icon(Icons.description, size: 18.sp, color: ColorName.primary),
              SizedBox(width: 4.w),
              Icon(Icons.description, size: 18.sp, color: ColorName.primary),
            ],
          ),

          SizedBox(height: 16.h),
          Divider(height: 1.h, color: Colors.grey.shade200),
          SizedBox(height: 12.h),

          // 4. Tombol Aksi (Wrap / Row)
          // Menggunakan strategi Icon Button agar muat di mobile
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Tombol Lihat Riwayat (Selalu ada)
              if (onViewHistory != null)
                _buildActionButton(
                  label: "Lihat Riwayat",
                  icon: Icons.visibility,
                  color: ColorName.primary,
                  onTap: onViewHistory!,
                  isFilled: true,
                ),

              // Tombol Edit / Opsi Lain (Pecah jadi 2 opsi via Modal)
              if (onRate != null || onReopen != null) ...[
                SizedBox(width: 8.w),
                _buildActionButton(
                  label: "Opsi",
                  icon: Icons.edit_note, // Ikon pensil/edit
                  color: Colors.orange,
                  isFilled: false,
                  onTap: () => _showOptionsModal(context),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  void _showOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              if (onReopen != null)
                ListTile(
                  leading: const Icon(Icons.refresh, color: Colors.red),
                  title: const Text("Ajukan Kembali"),
                  onTap: () {
                    Navigator.pop(context);
                    onReopen?.call();
                  },
                ),
              if (onRate != null)
                ListTile(
                  leading: const Icon(Icons.star_outline, color: Colors.amber),
                  title: const Text("Beri Rating"),
                  onTap: () {
                    Navigator.pop(context);
                    onRate?.call();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    bool isFilled = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isFilled ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: isFilled ? Colors.white : color,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: isFilled ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}