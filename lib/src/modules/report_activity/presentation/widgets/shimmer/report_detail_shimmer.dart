import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class ReportDetailShimmer extends StatelessWidget {
  const ReportDetailShimmer({super.key});

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
                      // Header Info (Pelapor & Tiket)
                      _buildHeaderShimmer(),
                      SizedBox(height: 24.h),

                      // Read-only fields (Judul, Aset, dll)
                      _buildFieldShimmer("Judul Pelaporan"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Aset"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Nomor Seri"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Kategori"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Sub Kategori"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Jenis Aset"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Lokasi"),
                      SizedBox(height: 20.h),
                      
                      // Rincian Masalah
                      _buildFieldShimmer("Rincian Masalah", height: 80.h),
                      SizedBox(height: 20.h),

                      // Attachments
                      _buildFieldShimmer("Lampiran", height: 60.h),
                      SizedBox(height: 20.h),

                      // Expected Solution
                      _buildFieldShimmer("Harapan", height: 80.h),
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
        Row(
          children: [
            Expanded(flex: 1, child: Container(height: 14.h, width: 50.w, color: Colors.white)),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(radius: 20.r, backgroundColor: Colors.white),
                  SizedBox(width: 12.w),
                  Container(height: 14.h, width: 100.w, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
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
        Container(width: 100.w, height: 14.h, color: Colors.white),
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