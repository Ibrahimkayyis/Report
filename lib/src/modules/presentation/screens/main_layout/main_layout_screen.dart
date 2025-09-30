import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/modules/presentation/screens/home/home_screen.dart';
import 'package:report/src/modules/presentation/screens/qr/qr_screen.dart';
import 'package:report/src/modules/presentation/screens/profile/profile_screen.dart';

@RoutePage()
class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeScreen(),
      ReportsScreen(),
      QRScreen(),
      KnowledgeBaseScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 28.sp, color: Colors.white),
      Icon(Icons.assignment, size: 28.sp, color: Colors.white),
      Icon(Icons.qr_code, size: 30.sp, color: Colors.white),
      Icon(Icons.book, size: 28.sp, color: Colors.white),
      Icon(Icons.person, size: 28.sp, color: Colors.white),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      // FAB tetap ada di Home
      floatingActionButton: _currentIndex == 0
          ? Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: FloatingActionButton(
                backgroundColor: ColorName.primary,
                onPressed: () {},
                child: const Icon(Icons.chat, color: ColorName.onPrimary),
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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

/// Placeholder Reports
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(title: Text(t.app.reports)),
      body: const Center(child: Text("Reports Screen (placeholder)")),
    );
  }
}

/// Placeholder Knowledge Base
class KnowledgeBaseScreen extends StatelessWidget {
  const KnowledgeBaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(title: Text(t.app.knowledge_base)),
      body: const Center(child: Text("Knowledge Base Screen (placeholder)")),
    );
  }
}
