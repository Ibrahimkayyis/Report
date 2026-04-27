import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class RFCFormShimmer extends StatelessWidget {
  const RFCFormShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Judul
                      _buildInputShimmer("Judul"),
                      SizedBox(height: 20.h),

                      // 2. Nama Pemohon
                      _buildInputShimmer("Nama Pemohon"),
                      SizedBox(height: 20.h),

                      // 3. OPD Asal (Dropdown)
                      _buildInputShimmer("OPD Asal (Dropdown)"),
                      SizedBox(height: 20.h),

                      // 4. Nomor HP
                      _buildInputShimmer("Nomor HP"),
                      SizedBox(height: 20.h),

                      // 5. Data Aset (Dropdown)
                      _buildInputShimmer("Data Aset (Dropdown)"),
                      SizedBox(height: 20.h),

                      // 6. Estimasi Waktu
                      _buildInputShimmer("Estimasi Waktu"),
                      SizedBox(height: 20.h),

                      // 7. Estimasi Biaya
                      _buildInputShimmer("Estimasi Biaya"),
                      SizedBox(height: 20.h),

                      // 8. Deskripsi (Multiline)
                      _buildInputShimmer("Deskripsi", height: 100.h),
                      SizedBox(height: 20.h),

                      // 9. Alasan Perubahan (Multiline)
                      _buildInputShimmer("Alasan Perubahan", height: 100.h),
                      SizedBox(height: 20.h),

                      // 10. Dampak Perubahan (Multiline)
                      _buildInputShimmer("Dampak Perubahan", height: 100.h),
                      SizedBox(height: 20.h),

                      // 11. Dampak Jika Tidak (Multiline)
                      _buildInputShimmer("Dampak Jika Tidak", height: 100.h),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Buttons Shimmer
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputShimmer(String label, {double height = 50.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 120.w, height: 14.h, color: Colors.white), // Label
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ],
    );
  }
}