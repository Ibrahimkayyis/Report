import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
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
  int _selectedTabIndex = 0;
  String? _selectedKategori;
  String? _selectedBentuk;
  String? _selectedJenis;
  String? _selectedStatus;

  int _currentPage = 1;
  final int _totalPages = 2;
  final int _totalData = 15;

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
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
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

    final stats = [
      TeknisiStatData(
        icon: Icons.check_circle_outline,
        title: t.app.dashboard.ticket_incoming,
        value: '15',
        subtitle: t.app.dashboard.ticket_incoming_desc,
        color: ColorName.primary,
      ),
      TeknisiStatData(
        icon: Icons.autorenew,
        title: t.app.dashboard.in_progress,
        value: '10',
        subtitle: t.app.dashboard.in_progress_desc,
        color: Colors.blue.shade700,
      ),
      TeknisiStatData(
        icon: Icons.access_time,
        title: t.app.dashboard.deadline,
        value: '1',
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

    final tickets = List.generate(10, (i) {
      return {
        'id': 'TCKT-${i + 1}',
        'userName': i == 0 ? 'Doni Ridho' : 'Rio Widoro',
        'date': '18/09/2024',
        'status': i.isEven ? 'Diproses' : 'Draft',
        'kategori': i.isEven ? 'Sistem Operasi' : 'Jaringan',
        'jenis': 'IT',
        'bentuk': 'Non-Fisik',
        'lampiranCount': (i % 3) + 1,
        'isDraft': i.isOdd,
      };
    });

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

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: TeknisiAppBar(onMenuPressed: _toggleSidebar),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.h),
            child: Column(
              children: [
                TeknisiStatsCards(stats: stats),
                SizedBox(height: 16.h),
                TeknisiTabSection(
                  selectedTabIndex: _selectedTabIndex,
                  onTabSelected: (index) {
                    setState(() => _selectedTabIndex = index);
                  },
                  onRefresh: () => debugPrint('Refresh data...'),
                  filterCard: TeknisiFilterCard(
                    selectedKategori: _selectedKategori,
                    selectedBentuk: _selectedBentuk,
                    selectedJenis: _selectedJenis,
                    selectedStatus: _selectedStatus,
                    onKategoriChanged: (v) =>
                        setState(() => _selectedKategori = v),
                    onBentukChanged: (v) => setState(() => _selectedBentuk = v),
                    onJenisChanged: (v) => setState(() => _selectedJenis = v),
                    onStatusChanged: (v) => setState(() => _selectedStatus = v),
                  ),
                  ticketList: TeknisiTicketList(tickets: tickets),

                  // 🔽 Ganti bagian pagination-nya dengan ini
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
                      totalData: _totalData,
                      startData: ((_currentPage - 1) * 10) + 1,
                      endData: _currentPage * 10 > _totalData
                          ? _totalData
                          : _currentPage * 10,
                      onPrevious: _currentPage > 1
                          ? () => setState(() => _currentPage--)
                          : null,
                      onNext: _currentPage < _totalPages
                          ? () => setState(() => _currentPage++)
                          : null,
                      onPageSelected: (page) {
                        setState(() => _currentPage = page);
                      },
                    ),
                  ),
                ),
              ],
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
    );
  }
}
