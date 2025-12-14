import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/teknisi_home/presentation/screens/home_teknisi_screen.dart';
import 'package:report/src/modules/profile/presentation/screens/profile_screen.dart';
import 'package:report/src/modules/report_activity/presentation/screens/activity_screen.dart';
import 'package:report/src/modules/qr/presentation/screens/qr_screen.dart';

// ✅ IMPORT SCREEN NOTIFIKASI KHUSUS TEKNISI
import 'package:report/src/modules/teknisi_notification/presentation/screens/teknisi_notification_screen.dart';

/// 🔹 Main layout khusus untuk user role = TEKNISI
@RoutePage()
class MainLayoutTeknisiScreen extends StatefulWidget {
  // ✅ Tambahkan parameter initialIndex (Konsistensi dengan MainLayoutScreen)
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
  late int _currentIndex; // Hapus inisialisasi langsung
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // ✅ Gunakan initialIndex dari parameter
    _currentIndex = widget.initialIndex;

    /// 🔧 Tab Teknisi
    _screens = const [
      HomeTeknisiScreen(),
      ActivityScreen(),
      QRScreen(),
      TeknisiNotificationScreen(), // ✅ SUDAH DIGANTI KE TEKNISI
      ProfileScreen(),
    ];
  }

  // ✅ Tambahkan logic update widget agar navigasi "Kembali ke Beranda" lancar
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
    final items = <Widget>[
      Icon(Icons.dashboard_customize, size: 28.sp, color: ColorName.white),
      Icon(Icons.assignment, size: 28.sp, color: ColorName.white),
      Icon(Icons.qr_code_scanner, size: 30.sp, color: ColorName.white),
      Icon(Icons.notifications, size: 28.sp, color: ColorName.white),
      Icon(Icons.person, size: 28.sp, color: ColorName.white),
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),

      floatingActionButton: _currentIndex == 0
          ? Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: FloatingActionButton(
                backgroundColor: ColorName.primary,
                onPressed: () {
                  context.router.push(const HelpdeskChatRoute());
                },
                child: const Icon(Icons.support_agent, color: ColorName.white),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

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