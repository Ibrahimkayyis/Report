import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/teknisi_home/presentation/screens/home_teknisi_screen.dart';
import 'package:report/src/modules/profile/presentation/screens/profile_screen.dart';
import 'package:report/src/modules/teknisi_notification/presentation/screens/teknisi_notification_screen.dart';

/// 🔹 Main layout khusus untuk user role = TEKNISI
@RoutePage()
class MainLayoutTeknisiScreen extends StatefulWidget {
  final int initialIndex;
  
  const MainLayoutTeknisiScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainLayoutTeknisiScreen> createState() =>
      _MainLayoutTeknisiScreenState();
}

class _MainLayoutTeknisiScreenState extends State<MainLayoutTeknisiScreen> {
  late int _currentIndex;
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    
    /// 🔧 Tab Teknisi - Hanya 3 Tab
    _screens = const [
      HomeTeknisiScreen(),          // Tab 0: Dashboard
      TeknisiNotificationScreen(),  // Tab 1: Notifikasi
      ProfileScreen(),              // Tab 2: Profile
    ];
  }

  @override
  void didUpdateWidget(MainLayoutTeknisiScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != _currentIndex) {
      setState(() {
        _currentIndex = widget.initialIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 🔧 Bottom Navigation Items - Hanya 3 Icon
    final items = <Widget>[
      Icon(Icons.dashboard_customize, size: 28.sp, color: ColorName.white),
      Icon(Icons.notifications, size: 28.sp, color: ColorName.white),
      Icon(Icons.person, size: 28.sp, color: ColorName.white),
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),
      
      // ❌ FloatingActionButton DIHAPUS
      // floatingActionButton: null, // Tidak perlu ditulis, default null
      
      /// ✅ CurvedNavigationBar dengan 3 Items
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavKey,
        index: _currentIndex,
        items: items,
        color: ColorName.primary,
        buttonBackgroundColor: ColorName.primary,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        height: 60.h,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}