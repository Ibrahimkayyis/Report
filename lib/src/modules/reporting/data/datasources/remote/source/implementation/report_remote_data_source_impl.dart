// lib/src/modules/reporting/data/datasources/remote/source/implementation/report_remote_data_source_impl.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
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

      // 🔹 Tambahkan field dasar
      formData.fields.addAll([
        MapEntry('opd_id', opdId),
        MapEntry('category_id', categoryId),
        MapEntry('description', description),
      ]);

      if (action != null && action.isNotEmpty) {
        formData.fields.add(MapEntry('action', action));
      }

      // 🔹 Tambahkan file jika ada
      if (file != null && file.path.isNotEmpty) {
        final exists = await file.exists();
        if (exists) {
          final filename = file.path.split('/').last;
          formData.files.add(MapEntry(
            'file',
            await MultipartFile.fromFile(file.path, filename: filename),
          ));
        } else {
          print('⚠️ File tidak ditemukan di path: ${file.path}');
        }
      } else {
        print('⚠️ Tidak ada file yang dilampirkan');
      }

      // 🧾 Logging detail FormData sebelum dikirim
      print('📦 FORM DATA AKAN DIKIRIM:');
      for (final field in formData.fields) {
        print('  🔸 Field: ${field.key} = ${field.value}');
      }
      for (final fileEntry in formData.files) {
        final MultipartFile multipartFile = fileEntry.value;
        print(
          '  📎 File field: ${fileEntry.key} | '
          'filename: ${multipartFile.filename} | '
          'contentType: ${multipartFile.contentType}',
        );
      }

      // 🚀 Kirim ke API
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

      // 🧩 Log hasil respons server
      print('✅ RESPONSE DARI SERVER (${response.statusCode}): ${response.data}');

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return ReportResponseMapper.fromJson(response.data);
      } else {
        throw Exception(
          'Gagal membuat laporan publik. Status code: ${response.statusCode}, response: ${response.data}',
        );
      }
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final msg = e.response?.data?['message'] ?? e.message ?? 'Terjadi kesalahan saat mengirim laporan.';
      print('❌ DIO ERROR: status=$status, data=$data');
      throw Exception('DioException: $msg');
    } catch (e) {
      print('❌ UNEXPECTED ERROR: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
