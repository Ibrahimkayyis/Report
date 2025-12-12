import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/mapper/report_response_mapper.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/report_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

@LazySingleton(as: ReportRemoteDataSource)
class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final Dio dio;

  ReportRemoteDataSourceImpl(this.dio);

  @override
  Future<ReportResponseModel> createReport({
    required int assetId,
    required String title,
    required String description,
    required String location,
    required String expectedResolution,
    required List<File> files,
  }) async {
    try {
      const endpoint = '/api/pelaporan-online';
      AppLogger.i("🚀 Sending Report to $endpoint");

      // 1. Siapkan FormData
      final formData = FormData();

      // 2. Tambahkan Field Text
      formData.fields.addAll([
        MapEntry('asset_id', assetId.toString()),
        MapEntry('title', title),
        MapEntry('description', description),
        MapEntry('lokasi_kejadian', location), // Mapping ke field API
        MapEntry('expected_resolution', expectedResolution),
      ]);

      // 3. Tambahkan Files (Multipart)
      if (files.isNotEmpty) {
        for (var file in files) {
          final fileName = file.path.split('/').last;
          formData.files.add(
            MapEntry(
              'files', // Key array sesuai dokumentasi API
              await MultipartFile.fromFile(
                file.path,
                filename: fileName,
              ),
            ),
          );
        }
      }

      // 4. Request POST
      final response = await dio.post(
        endpoint,
        data: formData,
        // options: Options(contentType: 'multipart/form-data'), // Dio otomatis set ini jika pakai FormData
      );

      // 5. Handle Response
      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.i("✅ Report Created Successfully");
        return ReportResponseMapper.fromJson(response.data);
      }

      throw Exception('Failed to create report: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal create report", e);
      rethrow;
    }
  }
}