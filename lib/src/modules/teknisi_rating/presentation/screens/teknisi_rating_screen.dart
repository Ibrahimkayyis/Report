import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';
import 'package:report/src/modules/teknisi_rating/presentation/cubits/teknisi_rating_cubit.dart';
import 'package:report/src/modules/teknisi_rating/presentation/cubits/teknisi_rating_state.dart';
import '../widgets/rating_card_item.dart';

@RoutePage()
class TeknisiRatingScreen extends StatefulWidget {
  const TeknisiRatingScreen({super.key});

  @override
  State<TeknisiRatingScreen> createState() => _TeknisiRatingScreenState();
}

class _TeknisiRatingScreenState extends State<TeknisiRatingScreen>
    with SingleTickerProviderStateMixin {
  
  // Instance Cubit di State agar bisa diakses di listener TabController
  late TeknisiRatingCubit _cubit;
  
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  int _currentPage = 1;
  final int _totalPages = 1;

  // Filter values
  String? _selectedKategori;
  String? _selectedBentuk;
  String? _selectedJenis;
  String? _selectedRating;

  // ✅ FILTER OPTIONS (Disesuaikan dengan Data API)
  final List<String> _kategoriOptions = ['Semua', 'ti', 'non-ti'];
  
  final List<String> _bentukOptions = [
    'Semua', 
    'Server', 'Komputer Desktop', 'Laptop', 'Printer', 
    'Monitor', 'Keyboard', 'Mouse', 'Router', 'Switch',
    'Kamera CCTV', 'Meja Kerja', 'Kursi Kerja', 'AC'
  ]; // Sesuai Sub-Kategori
  
  final List<String> _jenisOptions = ['Semua', 'barang', 'jasa'];
  
  final List<String> _ratingOptions = ['Semua', '1 ⭐', '2 ⭐', '3 ⭐', '4 ⭐', '5 ⭐'];

  @override
  void initState() {
    super.initState();
    
    // Init Cubit & Fetch Data
    _cubit = sl<TeknisiRatingCubit>()..fetchRatings();

    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        // Update filter tab di cubit saat tab berubah
        _cubit.updateFilter(tabIndex: _tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _cubit.close(); // Close manual karena init manual
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // Gunakan BlocProvider.value karena instance cubit dibuat di initState
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppPrimaryBar(
          title: t.app.rating.page_title,
          centerTitle: true,
        ),
        body: BlocBuilder<TeknisiRatingCubit, TeknisiRatingState>(
          builder: (context, state) {
            return Column(
              children: [
                /// Tab bar section
                Container(
                  color: ColorName.white,
                  child: TabBar(
                    controller: _tabController,
                    onTap: (index) {
                      _cubit.updateFilter(tabIndex: index);
                    },
                    labelColor: ColorName.primary,
                    unselectedLabelColor: Colors.grey.shade600,
                    labelStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: ColorName.primary,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(text: t.app.rating.tab_reporting),
                      Tab(text: t.app.rating.tab_service),
                    ],
                  ),
                ),

                /// Filter section
                _buildFilterSection(t, _cubit),

                SizedBox(height: 8.h),

                /// Content area (List)
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state.status == TeknisiRatingStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.status == TeknisiRatingStatus.failure) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline, color: Colors.red, size: 40),
                              SizedBox(height: 8.h),
                              Text(state.errorMessage ?? "Gagal memuat data"),
                              TextButton(
                                onPressed: () => _cubit.fetchRatings(),
                                child: const Text("Coba Lagi"),
                              ),
                            ],
                          ),
                        );
                      }

                      return _buildListView(state.filteredRatings, t);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterSection(Translations t, TeknisiRatingCubit cubit) {
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
                onPressed: () => cubit.fetchRatings(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.primary,
                  foregroundColor: ColorName.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                ),
                icon: Icon(Icons.refresh, size: 18.sp),
                label: Text(
                  t.app.rating.refresh,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          
          /// Baris 1: Kategori & Bentuk (Sub-Kategori)
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_category,
                  value: _selectedKategori,
                  items: _kategoriOptions,
                  onChanged: (v) {
                    setState(() => _selectedKategori = v);
                    cubit.updateFilter(kategori: v);
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_form, // UI Label: Bentuk
                  value: _selectedBentuk,
                  items: _bentukOptions, // Data: Sub-Kategori
                  onChanged: (v) {
                    setState(() => _selectedBentuk = v);
                    cubit.updateFilter(bentuk: v);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          /// Baris 2: Jenis & Rating
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_type,
                  value: _selectedJenis,
                  items: _jenisOptions,
                  onChanged: (v) {
                    setState(() => _selectedJenis = v);
                    cubit.updateFilter(jenis: v);
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppDropdownField(
                  label: t.app.rating.filter_rating,
                  value: _selectedRating,
                  items: _ratingOptions,
                  onChanged: (v) {
                    setState(() => _selectedRating = v);
                    cubit.updateFilter(rating: v);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<TeknisiRatingModel> data, Translations t) {
    final totalData = data.length;
    final startIndex = data.isEmpty ? 0 : 1;
    final endIndex = totalData;

    return Column(
      children: [
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
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return RatingCardItem(
                        senderName: item.creator.fullName,
                        
                        // Handle avatar null & empty
                        senderAvatar: (item.creator.profileUrl != null && item.creator.profileUrl!.isNotEmpty)
                            ? item.creator.profileUrl
                            : null,

                        // Handle date safety
                        dateIn: item.pengerjaanAwal.isNotEmpty
                            ? item.pengerjaanAwal.split('T')[0]
                            : '-',
                        dateOut: item.pengerjaanAkhir.isNotEmpty
                            ? item.pengerjaanAkhir.split('T')[0]
                            : '-',
                            
                        category: item.asset?.kategori ?? '-',
                        type: item.asset?.jenisAsset ?? '-',
                        form: item.asset?.subkategoriNama ?? '-',
                        rating: item.rating,
                        onViewPressed: () {
                          context.router.push(
                            TeknisiRatingDetailRoute(ticketId: item.id),
                          );
                        },
                      );
                    },
                  ),
                ),
        ),
        if (data.isNotEmpty)
          AppPagination(
            currentPage: _currentPage,
            totalPages: _totalPages,
            totalData: totalData,
            startData: startIndex,
            endData: endIndex,
            onPrevious: null,
            onNext: null,
            onPageSelected: (page) {},
          ),
      ],
    );
  }
}