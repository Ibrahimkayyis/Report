part of '../../screens/opd_selection_screen.dart';

class OpdSelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OpdSelectionAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return AppBar(
      backgroundColor: ColorName.primary,
      foregroundColor: ColorName.onPrimary,
      title: Text(
        t.app.online_reporting_title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        ),
      ),
    );
  }
}
