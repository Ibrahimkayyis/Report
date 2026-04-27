import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class MasyarakatReportDetailShimmer extends StatelessWidget {
  const MasyarakatReportDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Info (Pengirim, NIK, ID Tiket)
                      _buildHeaderShimmer(),
                      SizedBox(height: 24.h),

                      // Judul Pelaporan
                      _buildFieldShimmer("Judul Pelaporan"),
                      SizedBox(height: 20.h),

                      // Rincian Masalah (Lebih tinggi)
                      _buildFieldShimmer("Rincian Masalah", height: 100.h),
                      SizedBox(height: 20.h),

                      // Attachments
                      _buildFieldShimmer("Lampiran", height: 60.h),
                    ],
                  ),
                ),
              ),

              // Bottom Button Shimmer (Back Button)
              Container(
                padding: EdgeInsets.all(16.w),
                color: Colors.white,
                child: Container(
                  height: 48.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderShimmer() {
    return Column(
      children: [
        // Row 1: Pengirim (Avatar + Nama)
        Row(
          children: [
            Expanded(flex: 1, child: Container(height: 14.h, width: 50.w, color: Colors.white)),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(radius: 20.r, backgroundColor: Colors.white),
                  SizedBox(width: 12.w),
                  Container(height: 14.h, width: 120.w, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        
        // Row 2: NIK
        Row(
          children: [
            Expanded(flex: 1, child: Container(height: 14.h, width: 30.w, color: Colors.white)),
            Expanded(flex: 2, child: Container(height: 14.h, width: 100.w, color: Colors.white)),
          ],
        ),
        SizedBox(height: 16.h),

        // Row 3: ID Tiket (Box)
        Row(
          children: [
            Expanded(flex: 1, child: Container(height: 14.h, width: 50.w, color: Colors.white)),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFieldShimmer(String label, {double height = 50.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 100.w, height: 14.h, color: Colors.white), // Label
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