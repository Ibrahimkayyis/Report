import 'dart:io';
import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

abstract class ServiceRequestRepository {
  /// Mengambil daftar sub-kategori aset untuk dropdown
  /// Endpoint: GET /api/sub-kategori
  Future<List<AssetSubCategoryModel>> getSubCategories();

  /// Mengirim pengajuan layanan baru
  /// Endpoint: POST /api/pengajuan-pelayanan
  Future<ServiceRequestResponseModel> createServiceRequest({
    required int subCategoryId, // Di API parameternya 'nama_asset' (ID)
    required String title,
    String? location, // Di API parameternya 'lokasi_penempatan'
    required String description,
    String? expectedResolution,
    List<File>? files,
  });
}