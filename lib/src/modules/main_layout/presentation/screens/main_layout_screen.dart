import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/home/presentation/screens/home_screen.dart';
import 'package:report/src/modules/qr/presentation/screens/qr_screen.dart';
import 'package:report/src/modules/profile/presentation/screens/profile_screen.dart';
import 'package:report/src/modules/report_activity/presentation/screens/activity_screen.dart';
import 'package:report/src/modules/notification/presentation/screens/notification_screen.dart';

@RoutePage()
class MainLayoutScreen extends StatefulWidget {
  final int initialIndex;

  const MainLayoutScreen({
    super.key,
    this.initialIndex = 0, // Default 0 (Home)
  });

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late int _currentIndex;
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;

    _screens = const [
      HomeScreen(),
      ActivityScreen(),
      QRScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
  }

  // ✅ PERBAIKAN UTAMA DISINI
  @override
  void didUpdateWidget(MainLayoutScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Cek apakah index yang diminta Router berbeda dengan Tab yang sedang aktif
    // Jika Router minta index 0 (Home), tapi kita sedang di 2 (QR), maka paksa pindah.
    if (widget.initialIndex != _currentIndex) {
      setState(() {
        _currentIndex = widget.initialIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 28.sp, color: ColorName.white),
      Icon(Icons.assignment, size: 28.sp, color: ColorName.white),
      Icon(Icons.qr_code_scanner, size: 30.sp, color: ColorName.white),
      Icon(
        Icons.notifications,
        size: 28.sp,
        color: ColorName.white,
      ),
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
                child: const Icon(Icons.support_agent, color: ColorName.onPrimary),
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