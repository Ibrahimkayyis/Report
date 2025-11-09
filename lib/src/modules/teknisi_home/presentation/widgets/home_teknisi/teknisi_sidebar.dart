import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiSidebar extends StatelessWidget {
  final VoidCallback onClose;
  final String userName;
  final String userEmail;
  final String? userAvatarUrl;
  final List<TeknisiMenuItem> menuItems;

  const TeknisiSidebar({
    super.key,
    required this.onClose,
    required this.userName,
    required this.userEmail,
    this.userAvatarUrl,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: double.infinity,
      margin: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 8.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha:0.15),
            blurRadius: 20,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header with User Info
            _buildHeader(),
            SizedBox(height: 20.h),
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: menuItems.map((item) {
                  if (item.isDivider) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Divider(
                        height: 1.h,
                        thickness: 1,
                        indent: 20.w,
                        endIndent: 20.w,
                        color: Colors.grey.shade300,
                      ),
                    );
                  }
                  return _buildMenuItem(
                    icon: item.icon,
                    title: item.title,
                    onTap: item.onTap,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: ColorName.primary,
            backgroundImage:
                userAvatarUrl != null ? NetworkImage(userAvatarUrl!) : null,
            child: userAvatarUrl == null
                ? Icon(
                    Icons.person,
                    color: ColorName.white,
                    size: 32.sp,
                  )
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: ColorName.textPrimary,
        size: 22.sp,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: ColorName.textPrimary,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }
}

// Model untuk menu item
class TeknisiMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDivider;

  const TeknisiMenuItem({
    this.icon = Icons.circle,
    this.title = '',
    required this.onTap,
    this.isDivider = false,
  });

  // Factory untuk divider
  factory TeknisiMenuItem.divider() {
    return TeknisiMenuItem(
      onTap: () {},
      isDivider: true,
    );
  }
}