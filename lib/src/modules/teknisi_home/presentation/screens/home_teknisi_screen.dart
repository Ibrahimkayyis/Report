import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/teknisi_home/presentation/cubits/teknisi_home_cubit.dart';
import 'package:report/src/modules/teknisi_home/presentation/cubits/teknisi_home_state.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_app_bar.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_sidebar.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_stats_cards.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_tab_section.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_filter_card.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_ticket_list.dart';

@RoutePage()
class HomeTeknisiScreen extends StatefulWidget {
  const HomeTeknisiScreen({super.key});

  @override
  State<HomeTeknisiScreen> createState() => _HomeTeknisiScreenState();
}

class _HomeTeknisiScreenState extends State<HomeTeknisiScreen>
    with SingleTickerProviderStateMixin {
  
  // Local State untuk UI Filter
  int _selectedTabIndex = 0;
  String? _selectedSubKategori;
  String? _selectedPriority; // ✅ Ganti Bentuk/Jenis
  String? _selectedStatusTeknisi;

  int _currentPage = 1;
  final int _totalPages = 1; 

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isSidebarVisible = false;

  final String _userName = 'Teknisi User';
  final String _userEmail = 'teknisi@example.com';
  final String? _userAvatarUrl = null;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
      if (_isSidebarVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  // --- Navigation Methods ---
  void _navigateToDashboard() {
    _toggleSidebar();
    AppLogger.d('Navigate to Dashboard');
  }

  void _navigateToMyTickets() {
    _toggleSidebar();
    AppLogger.d('Navigate to My Tickets');
  }

  void _navigateToHistory() {
    _toggleSidebar();
    AppLogger.d('Navigate to History');
  }

  void _navigateToSettings() {
    _toggleSidebar();
    AppLogger.d('Navigate to Settings');
  }

  void _navigateToKnowledgeBase() {
    _toggleSidebar();
    context.router.push(const KnowledgeBaseRoute());
  }

  void _navigateToRating() {
    _toggleSidebar();
    context.router.push(const TeknisiRatingRoute());
  }

  void _navigateToRFC() {
    _toggleSidebar();
    context.router.push(const RFCRoute());
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final menuItems = [
      TeknisiMenuItem(
        icon: Icons.dashboard,
        title: t.app.dashboard.menu_dashboard,
        onTap: _navigateToDashboard,
      ),
      TeknisiMenuItem(
        icon: Icons.assignment,
        title: t.app.dashboard.menu_my_tickets,
        onTap: _navigateToMyTickets,
      ),
      TeknisiMenuItem(
        icon: Icons.history,
        title: t.app.dashboard.menu_history,
        onTap: _navigateToHistory,
      ),
      TeknisiMenuItem(
        icon: Icons.book_outlined,
        title: t.app.dashboard.menu_knowledge_base,
        onTap: _navigateToKnowledgeBase,
      ),
      TeknisiMenuItem(
        icon: Icons.star_rate_rounded,
        title: 'Rating',
        onTap: _navigateToRating,
      ),
      TeknisiMenuItem(
        icon: Icons.change_circle_outlined,
        title: t.app.rfc.rfc_title,
        onTap: _navigateToRFC,
      ),
      TeknisiMenuItem(
        icon: Icons.settings,
        title: t.app.dashboard.menu_settings,
        onTap: _navigateToSettings,
      ),
    ];

    return BlocProvider(
      create: (_) => sl<TeknisiHomeCubit>()..fetchTickets(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: TeknisiAppBar(onMenuPressed: _toggleSidebar),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80.h),
              child: BlocBuilder<TeknisiHomeCubit, TeknisiHomeState>(
                builder: (context, state) {
                  final cubit = context.read<TeknisiHomeCubit>();

                  // Statistik Dinamis
                  final totalIncoming = state.allTickets.length;
                  final totalInProgress = state.allTickets
                      .where((t) => t.statusTeknisi.toLowerCase() != 'draft')
                      .length;
                  
                  final stats = [
                    TeknisiStatData(
                      icon: Icons.check_circle_outline,
                      title: t.app.dashboard.ticket_incoming,
                      value: '$totalIncoming',
                      subtitle: t.app.dashboard.ticket_incoming_desc,
                      color: ColorName.primary,
                    ),
                    TeknisiStatData(
                      icon: Icons.autorenew,
                      title: t.app.dashboard.in_progress,
                      value: '$totalInProgress',
                      subtitle: t.app.dashboard.in_progress_desc,
                      color: Colors.blue.shade700,
                    ),
                    TeknisiStatData(
                      icon: Icons.access_time,
                      title: t.app.dashboard.deadline,
                      value: '0', 
                      subtitle: t.app.dashboard.deadline_desc,
                      color: Colors.orange.shade700,
                    ),
                    TeknisiStatData(
                      icon: Icons.refresh,
                      title: t.app.dashboard.reopen,
                      value: '0', 
                      subtitle: t.app.dashboard.reopen_desc,
                      color: Colors.green.shade700,
                    ),
                  ];

                  return Column(
                    children: [
                      TeknisiStatsCards(stats: stats),
                      
                      SizedBox(height: 16.h),
                      
                      TeknisiTabSection(
                        selectedTabIndex: _selectedTabIndex,
                        onTabSelected: (index) {
                          setState(() => _selectedTabIndex = index);
                          cubit.updateFilter(tabIndex: index);
                        },
                        onRefresh: () => cubit.fetchTickets(),
                        
                        // ✅ Filter Card Updated
                        filterCard: TeknisiFilterCard(
                          selectedSubKategori: _selectedSubKategori,
                          selectedPriority: _selectedPriority,
                          selectedStatusTeknisi: _selectedStatusTeknisi,
                          
                          onSubKategoriChanged: (v) {
                            setState(() => _selectedSubKategori = v);
                            cubit.updateFilter(subKategori: v);
                          },
                          onPriorityChanged: (v) {
                            setState(() => _selectedPriority = v);
                            cubit.updateFilter(priority: v);
                          },
                          onStatusTeknisiChanged: (v) {
                            setState(() => _selectedStatusTeknisi = v);
                            cubit.updateFilter(statusTeknisi: v);
                          },
                        ),
                        
                        // List & Loading
                        ticketList: Builder(
                          builder: (context) {
                            if (state.status == TeknisiHomeStatus.loading) {
                              return Container(
                                height: 300.h,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            }
                            
                            if (state.status == TeknisiHomeStatus.failure) {
                              return Container(
                                height: 300.h,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error_outline, color: Colors.red, size: 40),
                                    SizedBox(height: 8.h),
                                    Text(state.errorMessage ?? "Terjadi Kesalahan"),
                                    TextButton(
                                      onPressed: () => cubit.fetchTickets(),
                                      child: const Text("Coba Lagi"),
                                    )
                                  ],
                                ),
                              );
                            }

                            return TeknisiTicketList(tickets: state.filteredTickets);
                          },
                        ),

                        // Pagination (UI Only)
                        pagination: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            border: Border(
                              top: BorderSide(color: Colors.grey.shade200, width: 1),
                            ),
                          ),
                          child: AppPagination(
                            currentPage: _currentPage,
                            totalPages: _totalPages,
                            totalData: state.filteredTickets.length,
                            startData: state.filteredTickets.isEmpty ? 0 : 1,
                            endData: state.filteredTickets.length,
                            onPrevious: null,
                            onNext: null,
                            onPageSelected: (page) {},
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            
            if (_isSidebarVisible)
              GestureDetector(
                onTap: _toggleSidebar,
                child: Container(color: Colors.black.withValues(alpha: 0.5)),
              ),
            
            SlideTransition(
              position: _slideAnimation,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TeknisiSidebar(
                  onClose: _toggleSidebar,
                  userName: _userName,
                  userEmail: _userEmail,
                  userAvatarUrl: _userAvatarUrl,
                  menuItems: menuItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}