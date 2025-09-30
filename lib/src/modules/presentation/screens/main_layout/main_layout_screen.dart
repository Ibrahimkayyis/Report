import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/modules/presentation/screens/home/home_screen.dart';
import 'package:report/src/modules/presentation/screens/qr/qr_screen.dart';
import 'package:report/src/modules/presentation/screens/profile/profile_screen.dart';
import 'package:styled_widget/styled_widget.dart';

@RoutePage()
class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

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
    final t = context.t;

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      /// FAB hanya muncul di Home
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

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorName.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorName.textPrimary.withOpacity(0.15),
              blurRadius: 12.r,
              spreadRadius: 2.r,
              offset: Offset(0, -4.h),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(icon: Icons.home, label: t.app.home, index: 0),
                _buildNavItem(
                    icon: Icons.assignment, label: t.app.reports, index: 1),
                _buildQrButton(),
                _buildNavItem(
                    icon: Icons.book, label: t.app.knowledge_base, index: 3),
                _buildNavItem(
                    icon: Icons.person, label: t.app.profile, index: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Item nav
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _currentIndex == index;

    final Color targetColor =
        isSelected ? ColorName.primary : ColorName.textPrimary.withOpacity(0.6);

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: SizedBox(
        width: 55.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24.sp, color: targetColor)
                .animate(const Duration(milliseconds: 250), Curves.easeInOut)
                .scale(all: isSelected ? 1.15 : 1.0),
            SizedBox(height: 3.h),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: targetColor,
              ),
            ).animate(const Duration(milliseconds: 250), Curves.easeInOut),
          ],
        ),
      ),
    );
  }

  /// QR special
  Widget _buildQrButton() {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
      child: Container(
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: ColorName.primary,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: ColorName.primary.withOpacity(0.3),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Icon(Icons.qr_code, size: 28.sp, color: ColorName.onPrimary),
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
