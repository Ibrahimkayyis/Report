import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart'; // Import router
import 'package:report/src/core/widgets/app_bar/app_secondary_bar.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/mapper/asset_mapper.dart'; // Import Mapper
import 'package:report/src/modules/reporting/domain/models/asset_model.dart'; // Import Model

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

    AssetModel? assetModel;
    bool isValid = false;

    try {
      // 1. Decode String JSON ke Map
      final Map<String, dynamic> jsonMap = jsonDecode(qrValue) as Map<String, dynamic>;
      
      // 2. Gunakan Mapper untuk konversi ke AssetModel
      //    (Aman karena mapper Anda sudah handle null/missing fields)
      assetModel = AssetMapper.fromJson(jsonMap);

      // 3. Validasi minimal: harus ada ID dan Nama
      //    (Mapper mengisi ID default 0 jika null/error)
      isValid = assetModel.id != 0 && assetModel.namaAsset.isNotEmpty;
    } catch (_) {
      isValid = false;
      assetModel = null;
    }

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
                      color: Colors.black.withValues(alpha: 0.1),
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
                                color: ColorName.textPrimary.withValues(alpha: 0.7),
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
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: isValid && assetModel != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(t.asset_id, assetModel.id.toString()),
                          _buildInfoRow(t.asset_name, assetModel.namaAsset),
                          _buildInfoRow(t.asset_type, assetModel.jenis),
                          _buildInfoRow(
                            t.asset_type, 
                            assetModel.kategori, // Tambahan info kategori
                          ),
                          _buildInfoRow(
                            t.asset_location,
                            assetModel.assetBarang?.lokasi?.nama ?? '-',
                          ),
                          _buildInfoRow(
                            "Sub Kategori", // Bisa diganti t.asset_subcategory jika ada
                            assetModel.assetBarang?.subKategori?.nama ?? '-',
                          ),
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
                              color: ColorName.textPrimary.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      ),
              ),

              SizedBox(height: 40.h),

              /// ✅ Buttons
              Column(
                children: [
                  if (isValid && assetModel != null) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // ✅ Navigasi ke Form dengan membawa Data Aset
                          context.router.push(
                            ReportingFormRoute(prefilledAsset: assetModel),
                          );
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
              color: ColorName.textPrimary.withValues(alpha: 0.6),
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