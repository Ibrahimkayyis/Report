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
  Future<ReportResponseModel> createPublicReport({
    required String opdId,
    required String categoryId,
    required String description,
    String? action,
    File? file,
  }) async {
    try {
      final formData = FormData();

      // Tambahkan field dasar
      formData.fields.addAll([
        MapEntry('opd_id', opdId),
        MapEntry('category_id', categoryId),
        MapEntry('description', description),
      ]);

      if (action != null && action.isNotEmpty) {
        formData.fields.add(MapEntry('action', action));
      }

      // Tambahkan file jika ada
      if (file != null && file.path.isNotEmpty) {
        final exists = await file.exists();
        if (exists) {
          final filename = file.path.split('/').last;
          formData.files.add(MapEntry(
            'file',
            await MultipartFile.fromFile(file.path, filename: filename),
          ));
        } else {
          AppLogger.w('File tidak ditemukan di path: ${file.path}');
        }
      } else {
        AppLogger.w('Tidak ada file yang dilampirkan');
      }

      AppLogger.d('FORM DATA AKAN DIKIRIM:');
      for (final field in formData.fields) {
        AppLogger.d('Field: ${field.key} = ${field.value}');
      }

      for (final fileEntry in formData.files) {
        final MultipartFile mf = fileEntry.value;
        AppLogger.d(
          'File field: ${fileEntry.key} | filename: ${mf.filename} | contentType: ${mf.contentType}',
        );
      }

      // Kirim request
      final response = await dio.post(
        '/api/pelaporan-online',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
        ),
      );

      AppLogger.i(
        'Response dari server (${response.statusCode}): ${response.data}',
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return ReportResponseMapper.fromJson(response.data);
      } else {
        throw Exception(
          'Gagal membuat laporan publik. Status code: ${response.statusCode}, response: ${response.data}',
        );
      }
    } on DioException catch (e, st) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final msg = e.response?.data?['message'] ?? e.message ?? 'Terjadi kesalahan saat mengirim laporan.';

      AppLogger.e('DIO ERROR: status=$status, data=$data', e, st);
      throw Exception('DioException: $msg');
    } catch (e, st) {
      AppLogger.e('UNEXPECTED ERROR: $e', e, st);
      throw Exception('Unexpected error: $e');
    }
  }
}
