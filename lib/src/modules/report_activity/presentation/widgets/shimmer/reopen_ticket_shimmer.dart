import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:report/gen/colors.gen.dart';

class ReopenTicketShimmer extends StatelessWidget {
  const ReopenTicketShimmer({super.key});

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
                      // Target OPD (Simulasi)
                      Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Header Info (Pelapor & Tiket)
                      _buildHeaderShimmer(),
                      SizedBox(height: 24.h),

                      // Read-only fields (Judul, Aset, dll)
                      _buildFieldShimmer("Judul"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Aset"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Nomor Seri"),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Kategori"),
                      SizedBox(height: 24.h),

                      // Section Title
                      Container(
                        width: 150.w,
                        height: 20.h,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.h),

                      // Editable fields (Alasan & Expected)
                      _buildFieldShimmer("Alasan Reopen", height: 100.h),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Lampiran", height: 80.h),
                      SizedBox(height: 20.h),
                      _buildFieldShimmer("Harapan", height: 80.h),
                    ],
                  ),
                ),
              ),

              // Bottom Buttons Shimmer
              Container(
                padding: EdgeInsets.all(16.w),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.white),
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