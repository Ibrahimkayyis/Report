import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

class ServiceRequestMapper {
  
  static List<AssetSubCategoryModel> fromSubCategoryJsonList(
      List<dynamic> jsonList) {
    if (jsonList.isEmpty) {
      return [];
    }
    return jsonList.map((json) => AssetSubCategoryModel(
          id: json['id'] as int? ?? 0,
          nama: json['nama'] as String? ?? 'Unknown Category',
        )).toList();
  }

  /// Mapping JSON Response Sukses Pengajuan ke ServiceRequestResponseModel
  static ServiceRequestResponseModel fromResponseJson(
      Map<String, dynamic> json) {
    return ServiceRequestResponseModel(
      message: json['message'] as String? ?? 'Pengajuan berhasil dibuat',
      ticketId: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '-',
      title: json['title'] as String? ?? 'Tanpa Judul',
      serviceType: json['jenis_layanan'] as String? ?? 'pengajuan_pelayanan',
      
      // ✅ MAPPING NEW FIELDS
      opdName: json['opd_nama'] as String? ?? 'OPD Tujuan Tidak Diketahui',
      description: json['description'] as String? ?? '',
      location: json['lokasi_penempatan'] as String?,
      expectedResolution: json['expected_resolution'] as String?,
    );
  }
}