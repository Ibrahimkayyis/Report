import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class RFCDetailShimmer extends StatelessWidget {
  const RFCDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Judul
                _buildFieldShimmer("Judul"),
                SizedBox(height: 20.h),

                // 2. Nama Pemohon
                _buildFieldShimmer("Nama Pemohon"),
                SizedBox(height: 20.h),

                // 3. OPD Asal
                _buildFieldShimmer("OPD Asal"),
                SizedBox(height: 20.h),

                // 4. Data Asset
                _buildFieldShimmer("Data Asset"),
                SizedBox(height: 20.h),

                // 5. Kategori Aset
                _buildFieldShimmer("Kategori Aset"),
                SizedBox(height: 20.h),

                // 6. Deskripsi Aset (Multiline)
                _buildFieldShimmer("Deskripsi Aset", height: 80.h),
                SizedBox(height: 20.h),

                // 7. Estimasi Biaya
                _buildFieldShimmer("Estimasi Biaya"),
                SizedBox(height: 20.h),

                // 8. Alasan Perubahan (Multiline)
                _buildFieldShimmer("Alasan Perubahan", height: 100.h),
                SizedBox(height: 20.h),

                // 9. Dampak Perubahan (Multiline)
                _buildFieldShimmer("Dampak Perubahan", height: 100.h),
                SizedBox(height: 20.h),

                // 10. Dampak Jika Tidak (Multiline)
                _buildFieldShimmer("Dampak Jika Tidak", height: 100.h),
                SizedBox(height: 24.h),

                // 11. Status Box
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      Container(width: 24.w, height: 24.w, color: Colors.white),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 100.w, height: 12.h, color: Colors.white),
                          SizedBox(height: 4.h),
                          Container(width: 150.w, height: 14.h, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldShimmer(String label, {double height = 50.0}) {
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