import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import '../../../../core/widgets/app_bar/app_secondary_bar.dart';

@RoutePage()
class QRAssetDetailScreen extends StatelessWidget {
  final String qrValue;
  final Uint8List? qrImageBytes;

  const QRAssetDetailScreen({
    super.key,
    required this.qrValue,
    this.qrImageBytes,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.qr;

    Map<String, dynamic>? assetData;
    try {
      // Coba decode isi QR sebagai JSON
      assetData = jsonDecode(qrValue) as Map<String, dynamic>;
    } catch (_) {
      // Jika bukan JSON valid, biarkan null
      assetData = null;
    }

    // fallback data jika parsing gagal
    final bool isValid = assetData != null &&
        assetData.containsKey('id') &&
        assetData.containsKey('name');

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppSecondaryBar(title: t.asset_detail_title),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ✅ QR Preview (hasil capture kamera)
              Container(
                width: 220.w,
                height: 220.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: qrImageBytes != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.memory(
                          qrImageBytes!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.qr_code_2,
                                size: 80.sp, color: ColorName.primary),
                            SizedBox(height: 10.h),
                            Text(
                              t.qr_preview_label,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorName.textPrimary.withValues(alpha:0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              SizedBox(height: 28.h),

              /// ✅ Asset Information / Error Message
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: isValid
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(t.asset_id, assetData['id']),
                          _buildInfoRow(t.asset_name, assetData['name']),
                          _buildInfoRow(t.asset_type, assetData['type'] ?? '-'),
                          _buildInfoRow(
                              t.asset_location, assetData['location'] ?? '-'),
                          _buildInfoRow(t.asset_status, assetData['status'] ?? '-'),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Text(
                            t.invalid_qr_message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorName.textPrimary.withValues(alpha:0.7),
                            ),
                          ),
                        ),
                      ),
              ),

              SizedBox(height: 40.h),

              /// ✅ Buttons
              Column(
                children: [
                  if (isValid) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: arahkan ke form laporan
                        },
                        icon: const Icon(Icons.report_problem_outlined),
                        label: Text(
                          t.create_report_based_on_asset,
                          style: TextStyle(
                            color: ColorName.onPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorName.primary,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                  ],
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => context.router.pop(),
                      icon: const Icon(Icons.qr_code_scanner),
                      label: Text(
                        t.scan_again,
                        style: TextStyle(
                          color: ColorName.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: ColorName.primary, width: 2),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: ColorName.textPrimary.withValues(alpha:0.6),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorName.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
