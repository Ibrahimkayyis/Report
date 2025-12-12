import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/mapper/masyarakat_report_mapper.dart';
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/abstract/masyarakat_report_remote_data_source.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';

@LazySingleton(as: MasyarakatReportRemoteDataSource)
class MasyarakatReportRemoteDataSourceImpl
    implements MasyarakatReportRemoteDataSource {
  final Dio dio;

  MasyarakatReportRemoteDataSourceImpl(this.dio);

  @override
  Future<MasyarakatReportResponseModel> createPublicReport({
    required String title,
    required int idOpd,
    required String description,
    List<File>? files,
  }) async {
    try {
      const endpoint = '/api/pelaporan-online-masyarakat';
      AppLogger.i("📝 Creating Public Report: $endpoint");

      // Siapkan FormData
      final formData = FormData.fromMap({
        'title': title,
        'id_opd': idOpd,
        'description': description,
      });

      // Attach Files jika ada
      if (files != null && files.isNotEmpty) {
        for (var file in files) {
          final fileName = file.path.split('/').last;
          formData.files.add(MapEntry(
            'files', // Key sesuai dokumentasi API
            await MultipartFile.fromFile(file.path, filename: fileName),
          ));
        }
      }

      final response = await dio.post(endpoint, data: formData);

      if (response.statusCode == 200) {
        AppLogger.i("✅ Report Created: ${response.data}");
        return MasyarakatReportMapper.fromJson(response.data);
      }

      throw Exception('Failed to create report: ${response.statusCode}');
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;
        AppLogger.e("❌ Server Error Payload: $data");

        // Handle Validation Error (422)
        if (data is Map<String, dynamic> && data.containsKey('detail')) {
          final detail = data['detail'];
          if (detail is List && detail.isNotEmpty) {
             // Ambil pesan error pertama dari list detail
             final firstError = detail.first;
             if (firstError is Map && firstError.containsKey('msg')) {
               throw Exception("Validasi Gagal: ${firstError['msg']}");
             }
          }
        }
      }
      AppLogger.e("Gagal create public report (Dio)", e);
      rethrow;
    } catch (e) {
      AppLogger.e("Gagal create public report (General)", e);
      rethrow;
    }
  }
}