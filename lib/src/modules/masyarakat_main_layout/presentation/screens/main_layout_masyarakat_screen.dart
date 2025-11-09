import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/masyarakat_home/presentation/screens/home_masyarakat_screen.dart';
import 'package:report/src/modules/profile/presentation/screens/profile_screen.dart';
import 'package:report/src/modules/notification/presentation/screens/notification_screen.dart';

@RoutePage()
class MainLayoutMasyarakatScreen extends StatefulWidget {
  const MainLayoutMasyarakatScreen({super.key});

  @override
  State<MainLayoutMasyarakatScreen> createState() => _MainLayoutMasyarakatScreenState();
}

class _MainLayoutMasyarakatScreenState extends State<MainLayoutMasyarakatScreen> {
  int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeMasyarakatScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 28.sp, color: ColorName.white),
      Icon(Icons.notifications, size: 28.sp, color: ColorName.white),
      Icon(Icons.person, size: 28.sp, color: ColorName.white),
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),

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
