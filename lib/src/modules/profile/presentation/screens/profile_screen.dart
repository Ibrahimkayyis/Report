import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_list.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                // Profile Header (Photo, Name, Email)
                const ProfileHeader(
                  name: 'Jack William',
                  email: 'jackwilliam1704@gmail.com',
                  imageAsset: null, // Set to null to show default icon
                  // imageAsset: 'assets/images/profile_placeholder.png', // Use this when you have asset
                ),
                
                SizedBox(height: 8.h),
                
                // Menu List
                const ProfileMenuList(),
                
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}