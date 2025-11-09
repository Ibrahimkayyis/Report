import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/app_bar/app_primary_bar.dart';
import '../widgets/theme_preference_selector.dart';
import '../widgets/font_size_selector.dart';
import '../widgets/action_buttons.dart';

@RoutePage()
class EditThemeScreen extends StatefulWidget {
  const EditThemeScreen({super.key});

  @override
  State<EditThemeScreen> createState() => _EditThemeScreenState();
}

class _EditThemeScreenState extends State<EditThemeScreen> {
  int selectedThemeIndex = 1; // 0: system, 1: light, 2: dark
  int selectedFontIndex = 1;  // 0: small, 1: medium, 2: large

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppPrimaryBar(
        title: t.app.theme_settings_title,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 32.h,
              ),
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha:0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      // 🔹 Theme selector
                      ThemePreferenceSelector(
                        selectedIndex: selectedThemeIndex,
                        onChanged: (index) =>
                            setState(() => selectedThemeIndex = index),
                      ),

                      SizedBox(height: 32.h),

                      // 🔹 Font size selector
                      FontSizeSelector(
                        selectedIndex: selectedFontIndex,
                        onChanged: (index) =>
                            setState(() => selectedFontIndex = index),
                      ),

                      const Spacer(), // ✅ Dorong tombol ke bawah

                      SizedBox(height: 16.h),

                      // 🔹 Action buttons (tetap di bawah)
                      ActionButtons(
                        onCancel: () => context.router.pop(),
                        onSave: () => context.router.pop(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
