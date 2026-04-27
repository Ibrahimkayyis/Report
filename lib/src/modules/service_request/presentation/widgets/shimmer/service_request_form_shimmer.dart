import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class ServiceRequestFormShimmer extends StatelessWidget {
  const ServiceRequestFormShimmer({super.key});

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
                      // 1. Target OPD (Header Box)
                      Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // 2. Profile Section (Nama, Email, Divisi)
                      _buildProfileRowShimmer(),
                      SizedBox(height: 16.h),
                      _buildProfileRowShimmer(),
                      SizedBox(height: 16.h),
                      _buildProfileRowShimmer(),
                      
                      SizedBox(height: 24.h),

                      // 3. Judul Layanan
                      _buildInputShimmer("Judul Layanan"),
                      SizedBox(height: 24.h),

                      // 4. Nama Aset (Dropdown dari API)
                      _buildInputShimmer("Nama Aset (Dropdown)"),
                      SizedBox(height: 24.h),

                      // 5. Lokasi Layanan
                      _buildInputShimmer("Lokasi Layanan"),
                      SizedBox(height: 24.h),

                      // 6. Deskripsi Layanan (Tall)
                      _buildInputShimmer("Deskripsi Layanan", height: 100.h),
                      SizedBox(height: 24.h),

                      // 7. Attach File
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 100.w, height: 14.h, color: Colors.white),
                          SizedBox(height: 8.h),
                          Container(
                            width: double.infinity,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // 8. Expected Solution
                      _buildInputShimmer("Harapan Perbaikan", height: 80.h),
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
                    SizedBox(width: 12.w),
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

  Widget _buildProfileRowShimmer() {
    return Row(
      children: [
        Container(width: 80.w, height: 14.h, color: Colors.white), // Label
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ],
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