import 'dart:io';
import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

abstract class ServiceRequestRemoteDataSource {
  /// Mengambil daftar sub-kategori aset (dropdown list)
  Future<List<AssetSubCategoryModel>> getSubCategories();

  /// Mengirim pengajuan layanan baru
  Future<ServiceRequestResponseModel> createServiceRequest({
    required int subCategoryId,
    required String title,
    String? location,
    required String description,
    String? expectedResolution,
    List<File>? files,
  });
}