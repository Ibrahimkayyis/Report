import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/fields/app_dropdown_field.dart';

class NotificationHeader extends StatelessWidget {
  final VoidCallback onRefresh;
  final VoidCallback onDeleteMode;
  final ValueChanged<String?> onFilterChanged;
  final ValueChanged<String?> onTypeChanged;

  const NotificationHeader({
    super.key,
    required this.onRefresh,
    required this.onDeleteMode,
    required this.onFilterChanged,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.notifications;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔍 Search Field
          TextField(
            decoration: InputDecoration(
              hintText: t.search_placeholder,
              prefixIcon: const Icon(Icons.search, size: 20),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: ColorName.black.withValues(alpha: 0.2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: ColorName.black.withValues(alpha: 0.1)),
              ),
              filled: true,
              fillColor: ColorName.white,
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              /// Filter Dropdown (Status)
              Expanded(
                flex: 2,
                child: AppDropdownField(
                  label: "Status", // Label sebagai hint
                  showLabelAbove: false, // ✅ Tidak muncul di atas
                  value: null,
                  onChanged: onFilterChanged,
                  items: const [
                    "Semua",
                    "Belum Dibaca",
                    "Sudah Dibaca"
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// Type Dropdown (Jenis)
              Expanded(
                flex: 2,
                child: AppDropdownField(
                  label: "Tipe", // Label sebagai hint
                  showLabelAbove: false, // ✅ Tidak muncul di atas
                  value: null,
                  onChanged: onTypeChanged,
                  items: const [
                    "Semua",
                    "Tiket",
                    "Status",
                    "Pengumuman"
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// ⋮ Menu button (Refresh & Hapus)
              Container(
                height: 48.h, // Sesuaikan tinggi dropdown default
                width: 42.w,
                decoration: BoxDecoration(
                  color: ColorName.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'refresh') onRefresh();
                    if (value == 'delete') onDeleteMode();
                  },
                  icon: Icon(Icons.more_vert, color: ColorName.white, size: 22.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)
                  ),
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
        ],
      ),
    );
  }
}