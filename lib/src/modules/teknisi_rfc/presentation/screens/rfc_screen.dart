import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/app_bar/app_primary_bar.dart';
import 'package:report/src/core/widgets/widgets.dart'; // ✅ gunakan path global
import '../widgets/rfc_card_item.dart';

@RoutePage()
class RFCScreen extends StatefulWidget {
  const RFCScreen({super.key});

  @override
  State<RFCScreen> createState() => _RFCScreenState();
}

class _RFCScreenState extends State<RFCScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentPage = 1;

  // Dummy data
  final List<Map<String, dynamic>> _draftData = [
    {'id': '1', 'documentName': 'Panduan Cek Status', 'dateSent': '25/09/2024', 'status': 'Draft'},
    {'id': '2', 'documentName': 'Panduan Cek Status', 'dateSent': '20/09/2024', 'status': 'Draft'},
  ];

  final List<Map<String, dynamic>> _submittedData = [
    {'id': '3', 'documentName': 'Panduan Cek Status', 'dateSent': '25/09/2024', 'status': 'Menunggu review'},
    {'id': '4', 'documentName': 'Panduan Cek Status', 'dateSent': '19/09/2024', 'status': 'Ditolak'},
    {'id': '5', 'documentName': 'Panduan Cek Status', 'dateSent': '17/09/2024', 'status': 'Menunggu review'},
    {'id': '6', 'documentName': 'Panduan Cek Status', 'dateSent': '15/09/2024', 'status': 'Disetujui'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _currentData =>
      _tabController.index == 0 ? _draftData : _submittedData;

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.rfc;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppPrimaryBar(
        title: t.rfc_title,
        centerTitle: true,
      ),
      body: Column(
        children: [
          /// Tab bar section with Tambah button
          Container(
            color: ColorName.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => context.router.push(const RFCFormRoute()),
                        borderRadius: BorderRadius.circular(12.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey.shade300, width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(
                                  color: ColorName.primary,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Icon(Icons.add, color: ColorName.white, size: 18.sp),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                t.rfc_add_button,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorName.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                TabBar(
                  controller: _tabController,
                  onTap: (index) => setState(() {}),
                  labelColor: ColorName.primary,
                  unselectedLabelColor: Colors.grey.shade600,
                  labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  indicatorColor: ColorName.primary,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: t.rfc_tab_draft),
                    Tab(text: t.rfc_tab_submitted),
                  ],
                ),
              ],
            ),
          ),

          /// Content area
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListView(_draftData),
                _buildListView(_submittedData),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> data) {
    final t = context.t.app.rfc;
    final totalData = data.length;
    final startIndex = 1;
    final endIndex = totalData;
    final totalPages = 3; // Dummy untuk tampilan

    return Column(
      children: [
        /// List of RFC cards
        Expanded(
          child: data.isEmpty
              ? Center(
                  child: Text(
                    t.rfc_no_data,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return RFCCardItem(
                      documentName: item['documentName'],
                      dateSent: item['dateSent'],
                      status: item['status'],
                      onEditPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Edit ${item['documentName']}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),

        /// ✅ Pagination menggunakan widget global
        if (data.isNotEmpty)
          AppPagination(
            currentPage: _currentPage,
            totalPages: totalPages,
            totalData: totalData,
            startData: startIndex,
            endData: endIndex,
            onPrevious: _currentPage > 1
                ? () => setState(() => _currentPage--)
                : null,
            onNext: _currentPage < totalPages
                ? () => setState(() => _currentPage++)
                : null,
            onPageSelected: (page) => setState(() => _currentPage = page),
          ),
      ],
    );
  }
}
