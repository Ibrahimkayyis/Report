import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/widgets/app_bar/app_secondary_bar.dart';
import 'package:report/src/core/widgets/pagination/app_pagination.dart';
import '../widgets/activity_item.dart';

@RoutePage()
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // ✅ STATE PAGINATION
  int _currentPage = 1;
  final int _itemsPerPage = 5;
  
  // 📋 Dummy Data Lengkap (Semua item sekarang bisa diajukan kembali)
  final List<Map<String, dynamic>> _allActivities = [
    // Page 1
    {
      'id': 'LPR321336', 
      'title': 'Gangguan Router', 
      'date': '17-07-2025', 
      'canReopen': true, // ✅
      'canRate': true
    },
    {
      'id': 'LPR328129', 
      'title': 'Gangguan Printer', 
      'date': '17-07-2025', 
      'canReopen': true, // ✅ Ubah jadi true
      'canRate': true
    },
    {
      'id': 'LYN643758', 
      'title': 'Permintaan File Bulanan', 
      'date': '17-07-2025', 
      'canReopen': true, // ✅ Ubah jadi true
      'canRate': true
    },
    {
      'id': 'LYN912822', 
      'title': 'Permintaan Printer', 
      'date': '17-07-2025', 
      'canReopen': true, // ✅
      'canRate': true
    },
    {
      'id': 'LPR823471', 
      'title': 'Gangguan WiFi', 
      'date': '17-07-2025', 
      'canReopen': true, // ✅ Ubah jadi true
      'canRate': true
    },
    // Page 2
    {
      'id': 'LPR888888', 
      'title': 'Monitor Mati', 
      'date': '16-07-2025', 
      'canReopen': true, // ✅
      'canRate': false
    },
    {
      'id': 'LPR777777', 
      'title': 'Kabel LAN Putus', 
      'date': '16-07-2025', 
      'canReopen': true, // ✅
      'canRate': true
    },
    {
      'id': 'LPR666666', 
      'title': 'Server Down', 
      'date': '15-07-2025', 
      'canReopen': true, // ✅
      'canRate': false
    },
    {
      'id': 'LPR555555', 
      'title': 'Lupa Password', 
      'date': '15-07-2025', 
      'canReopen': true, // ✅
      'canRate': true
    },
    {
      'id': 'LPR444444', 
      'title': 'Update Antivirus', 
      'date': '14-07-2025', 
      'canReopen': true, // ✅
      'canRate': true
    },
    // Page 3
    {
      'id': 'LPR333333', 
      'title': 'Install Office', 
      'date': '13-07-2025', 
      'canReopen': true, // ✅
      'canRate': true
    },
    {
      'id': 'LPR222222', 
      'title': 'Mouse Rusak', 
      'date': '13-07-2025', 
      'canReopen': true, // ✅
      'canRate': false
    },
  ];

  // Logic untuk memotong list sesuai halaman
  List<Map<String, dynamic>> get _currentActivities {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    if (startIndex >= _allActivities.length) return [];
    return _allActivities.sublist(
      startIndex, 
      endIndex > _allActivities.length ? _allActivities.length : endIndex
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final t = context.t.app.report_activity; 
    final totalPages = (_allActivities.length / _itemsPerPage).ceil();
    final startData = ((_currentPage - 1) * _itemsPerPage) + 1;
    final endData = (_currentPage * _itemsPerPage) > _allActivities.length 
        ? _allActivities.length 
        : (_currentPage * _itemsPerPage);

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: const AppSecondaryBar(title: "Riwayat Laporan"),
      
      body: SafeArea(
        child: Column(
          children: [
            /// 🔍 Header (Search Bar Fixed)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari riwayat...",
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
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
            ),

            Divider(height: 1.h, color: ColorName.black.withValues(alpha: 0.1)),

            /// 📋 Activity List + Pagination
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                itemCount: _currentActivities.length + 1, 
                itemBuilder: (context, index) {
                  
                  // ✅ Render Pagination di Item Terakhir
                  if (index == _currentActivities.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: AppPagination(
                        currentPage: _currentPage,
                        totalPages: totalPages,
                        totalData: _allActivities.length,
                        startData: startData,
                        endData: endData,
                        onPageSelected: _onPageChanged,
                        onNext: _currentPage < totalPages 
                            ? () => _onPageChanged(_currentPage + 1) 
                            : null,
                        onPrevious: _currentPage > 1 
                            ? () => _onPageChanged(_currentPage - 1) 
                            : null,
                      ),
                    );
                  }

                  // ✅ Render Activity Item
                  final a = _currentActivities[index];
                  return ActivityItem(
                    id: a['id'] as String,
                    title: a['title'] as String,
                    completionDate: a['date'] as String,
                    
                    // Callback Aksi
                    onViewHistory: () {
                      print("Lihat Riwayat ${a['id']}");
                    },
                    // Sekarang semua item bisa direopen
                    onReopen: (a['canReopen'] as bool) 
                        ? () => print("Ajukan Kembali ${a['id']}") 
                        : null,
                    onRate: (a['canRate'] as bool) 
                        ? () => print("Beri Rating ${a['id']}") 
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}