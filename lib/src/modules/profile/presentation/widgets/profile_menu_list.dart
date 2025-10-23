// lib/src/modules/profile/presentation/widgets/profile_menu_list.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'profile_menu_item.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      children: [
        // Edit Profile
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: t.app.edit_profile,
          onTap: () {
            context.router.push(const EditProfileRoute());
          },
        ),

        SizedBox(height: 16.h),

        // Change Password
        ProfileMenuItem(
          icon: Icons.lock_outline,
          title: t.app.change_password,
          onTap: () {
            // TODO: Navigate to change password
          },
        ),

        // SizedBox(height: 16.h),

        // // Language
        // ProfileMenuItem(
        //   icon: Icons.language,
        //   title: t.app.language,
        //   onTap: () {
        //     // TODO: Open language selection
        //   },
        // ),
        SizedBox(height: 16.h),

        // Theme
        ProfileMenuItem(
          icon: Icons.palette_outlined,
          title: t.app.theme,
          onTap: () {
            context.router.push(const EditThemeRoute());
          },
        ),

        SizedBox(height: 16.h),

        // FAQ
        ProfileMenuItem(
          icon: Icons.help_outline,
          title: t.app.faq,
          onTap: () {
            // TODO: Navigate to FAQ
          },
        ),

        SizedBox(height: 16.h),

        // About Us
        ProfileMenuItem(
          icon: Icons.info_outline,
          title: t.app.about_us,
          onTap: () {
            // TODO: Navigate to about us
          },
        ),

        SizedBox(height: 24.h),

        // Logout Button (Optional - uncomment if needed)
        // _buildLogoutButton(context, t),
      ],
    );
  }

  // Widget _buildLogoutButton(BuildContext context, TranslationsEn t) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: OutlinedButton(
  //       onPressed: () {
  //         // TODO: Show logout confirmation dialog
  //       },
  //       style: OutlinedButton.styleFrom(
  //         foregroundColor: Colors.red,
  //         side: BorderSide(color: Colors.red, width: 1.5.w),
  //         padding: EdgeInsets.symmetric(vertical: 14.h),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12.r),
  //         ),
  //       ),
  //       child: Text(
  //         t.app.logout,
  //         style: TextStyle(
  //           fontSize: 15.sp,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
