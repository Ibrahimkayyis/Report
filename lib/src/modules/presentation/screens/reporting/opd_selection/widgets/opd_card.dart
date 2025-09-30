part of '../opd_selection_screen.dart';

class OpdCard extends StatelessWidget {
  final OpdItem opd;
  const OpdCard({required this.opd, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigasi ke ReportingFormRoute dengan membawa data OPD
            context.router.push(
              ReportingFormRoute(
                opdName: opd.name,
                opdIcon: opd.icon,
                opdColor: opd.color,
              ),
            );
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: ColorName.primary,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: ColorName.primary.withOpacity(0.18),
                  blurRadius: 4.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icon container
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: opd.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(opd.icon, color: Colors.white, size: 24.sp),
                ),
                SizedBox(width: 14.w),
                // OPD name
                Expanded(
                  child: Text(
                    opd.name,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorName.onPrimary,
                      height: 1.3,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16.sp, color: ColorName.onPrimary.withOpacity(0.7)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
