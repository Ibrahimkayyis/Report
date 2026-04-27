import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class TeknisiNotificationDetailShimmer extends StatelessWidget {
  const TeknisiNotificationDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header (Title + Tag)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 150.w, height: 20.h, color: Colors.white),
                        SizedBox(height: 8.h),
                        Container(
                          width: 60.w, 
                          height: 24.h, 
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ],
                    ),
                    Container(width: 80.w, height: 14.h, color: Colors.white),
                  ],
                ),

                SizedBox(height: 24.h),

                // 2. MAIN CARD SHIMMER
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      // Ilustrasi (Lingkaran)
                      Container(
                        height: 80.w,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Judul Utama
                      Container(width: 120.w, height: 18.h, color: Colors.white),
                      SizedBox(height: 24.h),

                      // Ticket Number Box
                      Column(
                        children: [
                          Container(width: 60.w, height: 12.h, color: Colors.white),
                          SizedBox(height: 6.h),
                          Container(
                            width: 200.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Status Row
                      Container(
                        width: 80.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),

                      SizedBox(height: 24.h),
                      Divider(color: Colors.white),
                      SizedBox(height: 24.h),

                      // Info Detail (Jenis Layanan & OPD)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoItemShimmer(),
                          _buildInfoItemShimmer(),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // 3. Message Body
                Container(width: 100.w, height: 16.h, color: Colors.white),
                SizedBox(height: 8.h),
                Container(
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItemShimmer() {
    return Column(
      children: [
        Container(width: 20.w, height: 20.w, color: Colors.white),
        SizedBox(height: 4.h),
        Container(width: 60.w, height: 10.h, color: Colors.white),
        SizedBox(height: 2.h),
        Container(width: 80.w, height: 12.h, color: Colors.white),
      ],
    );
  }
}