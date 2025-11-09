import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class TeknisiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;
  final String? title;

  const TeknisiAppBar({
    super.key,
    required this.onMenuPressed,
    this.title 
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: ColorName.primary,
          size: 24.sp,
        ),
        onPressed: onMenuPressed,
      ),
      title: Text(
        t.app.dashboard.title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorName.primary,
        ),
      ),
      backgroundColor: ColorName.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
