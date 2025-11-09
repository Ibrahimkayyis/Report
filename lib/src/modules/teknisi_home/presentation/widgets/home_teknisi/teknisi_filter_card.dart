import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart'; // ✅ pakai dropdown global

/// Filter Card untuk HomeTeknisi
/// Hanya menampilkan UI dropdown — value & handler tetap dikendalikan parent.
class TeknisiFilterCard extends StatelessWidget {
  final String? selectedKategori;
  final String? selectedBentuk;
  final String? selectedJenis;
  final String? selectedStatus;

  final ValueChanged<String?> onKategoriChanged;
  final ValueChanged<String?> onBentukChanged;
  final ValueChanged<String?> onJenisChanged;
  final ValueChanged<String?> onStatusChanged;

  const TeknisiFilterCard({
    super.key,
    required this.selectedKategori,
    required this.selectedBentuk,
    required this.selectedJenis,
    required this.selectedStatus,
    required this.onKategoriChanged,
    required this.onBentukChanged,
    required this.onJenisChanged,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.app.dashboard.filterTitle, // "Filter pencarian"
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),

          /// 🔹 Baris pertama
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: t.app.dashboard.category, // "Kategori"
                  value: selectedKategori,
                  items: const ['Jaringan', 'Sistem Operasi', 'Aplikasi'], // contoh dummy
                  onChanged: onKategoriChanged,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: t.app.dashboard.form, // "Bentuk"
                  value: selectedBentuk,
                  items: const ['Fisik', 'Non-Fisik'], // contoh dummy
                  onChanged: onBentukChanged,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          /// 🔹 Baris kedua
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: t.app.dashboard.type, // "Jenis"
                  value: selectedJenis,
                  items: const ['IT', 'Non-IT'], // contoh dummy
                  onChanged: onJenisChanged,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: t.app.dashboard.status, // "Status"
                  value: selectedStatus,
                  items: const ['Diproses', 'Selesai', 'Draft'], // contoh dummy
                  onChanged: onStatusChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
