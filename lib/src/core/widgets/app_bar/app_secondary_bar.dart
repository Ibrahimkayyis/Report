import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

/// App bar sekunder dengan tampilan yang sama seperti AppPrimaryBar
/// tapi tanpa leading dan tanpa actions.
///
/// Biasanya digunakan di layar dengan navigasi statis
/// seperti Notification, About, Settings, dsb.
class AppSecondaryBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const AppSecondaryBar({
    super.key,
    required this.title,
    this.centerTitle = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Tidak ada tombol back
      backgroundColor: ColorName.primary,
      foregroundColor: ColorName.onPrimary,
      centerTitle: centerTitle,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorName.onPrimary,
        ),
      ),
    );
  }
}
