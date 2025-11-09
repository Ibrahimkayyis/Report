// lib/src/modules/profile/presentation/widgets/profile_menu_list.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'profile_menu_item.dart';

class ProfileMenuList extends StatelessWidget {
  final ProfileCubit
  profileCubit; // ✅ cubit aktif diteruskan dari ProfileScreen

  const ProfileMenuList({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      children: [
        // ✏️ Edit Profile
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: t.app.edit_profile,
          onTap: () {
            context.router
                .push(
                  EditProfileRoute(
                    profileCubit:
                        profileCubit, // ✅ kirim cubit aktif ke layar EditProfile
                  ),
                )
                .then((_) {
                  profileCubit.fetchProfile();
                });
          },
        ),

        SizedBox(height: 16.h),

        // 🔒 Change Password (belum diimplementasikan)
        ProfileMenuItem(
          icon: Icons.lock_outline,
          title: t.app.change_password,
          onTap: () {
            // TODO: Navigate to Change Password Screen
          },
        ),

        SizedBox(height: 16.h),

        // 🎨 Theme
        ProfileMenuItem(
          icon: Icons.palette_outlined,
          title: t.app.theme,
          onTap: () => context.router.push(const EditThemeRoute()),
        ),

        SizedBox(height: 16.h),

        // ❓ FAQ
        ProfileMenuItem(
          icon: Icons.help_outline,
          title: t.app.faq,
          onTap: () {
            // TODO: Navigate to FAQ
          },
        ),

        SizedBox(height: 16.h),

        // ℹ️ About Us
        ProfileMenuItem(
          icon: Icons.info_outline,
          title: t.app.about_us,
          onTap: () {
            // TODO: Navigate to About Us
          },
        ),

        SizedBox(height: 24.h),

        // 🚪 Logout
        _buildLogoutItem(context, t),
      ],
    );
  }

  Widget _buildLogoutItem(BuildContext context, Translations t) {
    return ProfileMenuItem(
      icon: Icons.logout,
      title: t.app.logout,
      onTap: () => _showLogoutDialog(context, t),
    );
  }

  void _showLogoutDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          t.app.confirm_logout_title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorName.textPrimary,
          ),
        ),
        content: Text(
          t.app.confirm_logout_message,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorName.textPrimary.withValues(alpha:0.7),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
            child: Text(
              t.app.cancel,
              style: TextStyle(
                color: ColorName.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () async {
              context.router.pop(); // close dialog
              await context.read<AuthCubit>().logout();

              // Navigate to Login & clear stack
              context.router.replaceAll([const LoginRoute()]);
            },
            child: Text(
              t.app.logout,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
