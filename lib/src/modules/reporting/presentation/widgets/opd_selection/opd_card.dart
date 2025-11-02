part of '../../screens/opd_selection_screen.dart';

class OpdCard extends StatelessWidget {
  final OpdItem opd;
  final VoidCallback? onTap;

  const OpdCard({required this.opd, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
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
                // 🔸 Icon container
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: opd.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(opd.icon, color: ColorName.white, size: 24.sp),
                ),
                SizedBox(width: 14.w),

                // 🔹 Nama OPD
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

                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: ColorName.onPrimary.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 🌟 SHIMMER VERSION
// 🌟 SHIMMER VERSION (lebih mirip card asli)
class OpdShimmerCard extends StatelessWidget {
  const OpdShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: ColorName.primary.withOpacity(0.15), // agar serupa card
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              // 🔘 Placeholder icon container (kiri)
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Icon(
                  Icons.apartment,
                  color: Colors.white70,
                  size: 24,
                ),
              ),

              SizedBox(width: 14.w),

              // 🔹 Placeholder teks (nama OPD)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      width: 120.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              // 🔸 Placeholder icon panah (kanan)
              Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

