import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';

class TeknisiFilterCard extends StatelessWidget {
  final String? selectedSubKategori;
  final String? selectedPriority;
  final String? selectedStatusTeknisi;

  final ValueChanged<String?> onSubKategoriChanged;
  final ValueChanged<String?> onPriorityChanged;
  final ValueChanged<String?> onStatusTeknisiChanged;

  const TeknisiFilterCard({
    super.key,
    required this.selectedSubKategori,
    required this.selectedPriority,
    required this.selectedStatusTeknisi,
    required this.onSubKategoriChanged,
    required this.onPriorityChanged,
    required this.onStatusTeknisiChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    // List Sub Kategori
    const subKategoriItems = [
      'Semua',
      'Server', 'Komputer Desktop', 'Laptop', 'Printer', 'Monitor',
      'Keyboard', 'Mouse', 'Router', 'Switch', 'Kamera CCTV',
      'Meja Kerja', 'Kursi Kerja', 'Lemari', 'AC', 'Telepon',
      'Proyektor', 'UPS', 'Kendaraan Dinas', 'Mesin Fotocopy', 'Scanner'
    ];

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
            t.app.dashboard.filterTitle,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),

          /// 🔹 Baris 1: Prioritas & Status Teknisi
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: "Prioritas",
                  value: selectedPriority,
                  // ✅ FIX: Tambahkan 'Critical'
                  items: const ['Semua', 'Low', 'Medium', 'High', 'Critical'],
                  onChanged: onPriorityChanged,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: "Status",
                  value: selectedStatusTeknisi,
                  // ✅ FIX: Hapus 'Selesai' (Hanya Draft & Diproses)
                  items: const ['Semua', 'Draft', 'Diproses'], 
                  onChanged: onStatusTeknisiChanged,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12.h),

          /// 🔹 Baris 2: Sub Kategori (Full Width)
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: "Sub Kategori Aset",
                  value: selectedSubKategori,
                  items: subKategoriItems, 
                  onChanged: onSubKategoriChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}