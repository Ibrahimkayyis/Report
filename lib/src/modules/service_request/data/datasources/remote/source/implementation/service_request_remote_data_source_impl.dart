import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/service_request/data/datasources/remote/mapper/service_request_mapper.dart';
import 'package:report/src/modules/service_request/data/datasources/remote/source/abstract/service_request_remote_data_source.dart';
import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

@LazySingleton(as: ServiceRequestRemoteDataSource)
class ServiceRequestRemoteDataSourceImpl implements ServiceRequestRemoteDataSource {
  final Dio dio;

  ServiceRequestRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AssetSubCategoryModel>> getSubCategories() async {
    try {
      const endpoint = '/api/sub-kategori';
      AppLogger.i("📡 Fetching Sub Categories: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        // API mengembalikan List of Objects
        return ServiceRequestMapper.fromSubCategoryJsonList(response.data);
      }

      throw Exception('Failed to load sub categories: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch sub categories", e);
      rethrow;
    }
  }

  @override
  Future<ServiceRequestResponseModel> createServiceRequest({
    required int subCategoryId,
    required String title,
    String? location,
    required String description,
    String? expectedResolution,
    List<File>? files,
  }) async {
    try {
      const endpoint = '/api/pengajuan-pelayanan';
      AppLogger.i("🚀 Sending Service Request to $endpoint");

      // 1. Siapkan FormData (karena ada potensi upload file)
      final formData = FormData();

      // 2. Tambahkan Field Text
      formData.fields.addAll([
        // API meminta ID sub-kategori di parameter 'nama_asset' (int)
        MapEntry('nama_asset', subCategoryId.toString()), 
        MapEntry('title', title),
        MapEntry('description', description),
        // Mapping 'location' ke 'lokasi_penempatan' di API
        if (location != null && location.isNotEmpty) 
          MapEntry('lokasi_penempatan', location),
        if (expectedResolution != null && expectedResolution.isNotEmpty)
          MapEntry('expected_resolution', expectedResolution),
      ]);

      // 3. Tambahkan Files (jika ada)
      if (files != null && files.isNotEmpty) {
        for (var file in files) {
          final fileName = file.path.split('/').last;
          formData.files.add(
            MapEntry(
              'files', // Key array sesuai dokumentasi API
              await MultipartFile.fromFile(file.path, filename: fileName),
            ),
          );
        }
      }

      // 4. Request POST
      final response = await dio.post(endpoint, data: formData);

      // 5. Handle Response
      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.i("✅ Service Request Created Successfully");
        return ServiceRequestMapper.fromResponseJson(response.data);
      }

      throw Exception('Failed to create service request: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal create service request", e);
      rethrow;
    }
  }
}