import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/app_bar/app_primary_bar.dart';
import 'package:report/src/core/widgets/widgets.dart'; // ✅ gunakan widget global
import '../widgets/rating_card_item.dart';

@RoutePage()
class TeknisiRatingScreen extends StatefulWidget {
  const TeknisiRatingScreen({super.key});

  @override
  State<TeknisiRatingScreen> createState() => _TeknisiRatingScreenState();
}

class _TeknisiRatingScreenState extends State<TeknisiRatingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  // Filter values
  String? _selectedKategori;
  String? _selectedBentuk;
  String? _selectedJenis;
  String? _selectedRating;

  // Filter options
  final List<String> _kategoriOptions = [
    'Sistem Operasi',
    'Jaringan',
    'Aplikasi',
    'Email',
  ];
  final List<String> _bentukOptions = ['Fisik', 'Non-Fisik'];
  final List<String> _jenisOptions = ['IT', 'Non-IT'];
  final List<String> _ratingOptions = ['1 ⭐', '2 ⭐', '3 ⭐', '4 ⭐', '5 ⭐'];

  // Dummy data (Pelaporan dan Pelayanan)
  final List<Map<String, dynamic>> _pelaporanData = [
    {
      'senderName': 'Doni Ridho',
      'senderAvatar': 'https://i.pravatar.cc/150?img=1',
      'dateIn': '18/09/2024',
      'dateOut': '18/09/2024',
      'category': 'Sistem Operasi',
      'type': 'IT',
      'form': 'Non-Fisik',
      'rating': 4,
    },
    {
      'senderName': 'Rio Widoro',
      'senderAvatar': 'https://i.pravatar.cc/150?img=2',
      'dateIn': '18/09/2024',
      'dateOut': '18/09/2024',
      'category': 'Jaringan',
      'type': 'IT',
      'form': 'Non-Fisik',
      'rating': 4,
    },
    {
      'senderName': 'Lia Yustia',
      'senderAvatar': 'https://i.pravatar.cc/150?img=5',
      'dateIn': '17/09/2024',
      'dateOut': '17/09/2024',
      'category': 'Aplikasi',
      'type': 'Non-IT',
      'form': 'Fisik',
      'rating': 5,
    },
  ];

  final List<Map<String, dynamic>> _pelayananData = [
    {
      'senderName': 'Ahmad Zaki',
      'senderAvatar': 'https://i.pravatar.cc/150?img=12',
      'dateIn': '18/09/2024',
      'dateOut': '18/09/2024',
      'category': 'Jaringan',
      'type': 'IT',
      'form': 'Fisik',
      'rating': 5,
    },
    {
      'senderName': 'Siti Nurhaliza',
      'senderAvatar': 'https://i.pravatar.cc/150?img=13',
      'dateIn': '17/09/2024',
      'dateOut': '17/09/2024',
      'category': 'Aplikasi',
      'type': 'IT',
      'form': 'Non-Fisik',
      'rating': 4,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppPrimaryBar(title: t.app.rating.page_title, centerTitle: true),
      body: Column(
        children: [
          /// Tab bar section
          Container(
            color: ColorName.white,
            child: TabBar(
              controller: _tabController,
              onTap: (index) => setState(() {}),
              labelColor: ColorName.primary,
              unselectedLabelColor: Colors.grey.shade600,
              labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              indicatorColor: ColorName.primary,
              indicatorWeight: 3,
              tabs: [
                Tab(text: t.app.rating.tab_reporting),
                Tab(text: t.app.rating.tab_service),
              ],
            ),
          ),

          /// Filter section
          _buildFilterSection(t),

          SizedBox(height: 8.h),

          /// Content area
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListView(_pelaporanData, t),
                _buildListView(_pelayananData, t),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(Translations t) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Filter title + Refresh button
          Row(
            children: [
              Expanded(
                child: Text(
                  t.app.rating.filter_search,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.primary,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.primary,
                  foregroundColor: ColorName.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                icon: Icon(Icons.refresh, size: 18.sp),
                label: Text(
                  t.app.rating.refresh,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          /// Filter Row 1
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_category,
                  value: _selectedKategori,
                  items: _kategoriOptions,
                  onChanged: (v) => setState(() => _selectedKategori = v),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_form,
                  value: _selectedBentuk,
                  items: _bentukOptions,
                  onChanged: (v) => setState(() => _selectedBentuk = v),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          /// Filter Row 2
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_type,
                  value: _selectedJenis,
                  items: _jenisOptions,
                  onChanged: (v) => setState(() => _selectedJenis = v),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_rating,
                  value: _selectedRating,
                  items: _ratingOptions,
                  onChanged: (v) => setState(() => _selectedRating = v),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> data, Translations t) {
    final totalData = data.length;
    final startIndex = 1;
    final endIndex = totalData > 10 ? 10 : totalData;
    const totalPages = 3; // Dummy value

    return Column(
      children: [
        /// List of Rating cards
        Expanded(
          child: data.isEmpty
              ? Center(
                  child: Text(
                    t.app.rating.no_data,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                  ),
                )
              : Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  thickness: 4.w,
                  radius: Radius.circular(8.r),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 24.w,
                      top: 16.h,
                      bottom: 16.h,
                    ),
                    itemCount: data.length > 10 ? 10 : data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return RatingCardItem(
                        senderName: item['senderName'],
                        senderAvatar: item['senderAvatar'],
                        dateIn: item['dateIn'],
                        dateOut: item['dateOut'],
                        category: item['category'],
                        type: item['type'],
                        form: item['form'],
                        rating: item['rating'],
                        onViewPressed: () {
                          context.router.push(
                            TeknisiRatingDetailRoute(
                              senderName: item['senderName'],
                              category: item['category'],
                              type: item['type'],
                              form: item['form'],
                              rating: item['rating'],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ),

        /// ✅ Global Pagination
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
