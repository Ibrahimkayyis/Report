import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';

class MasyarakatReportMapper {
  static MasyarakatReportResponseModel fromJson(Map<String, dynamic> json) {
    return MasyarakatReportResponseModel(
      message: json['message'] as String? ?? '',
      ticketId: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '', // ✅ Mapped
      serviceType: json['jenis_layanan'] as String? ?? '',
      opdId: (json['opd_tujuan'] as num?)?.toInt() ?? 0,
      opdName: json['opd_nama'] as String? ?? 'OPD Tidak Diketahui', // ✅ Mapped
      createdAt: json['created_at'] as String? ?? '',
      location: json['lokasi_kejadian'] as String?,
      userStatus: json['status_ticket_pengguna'] as String? ?? '',
      status: json['status'] as String? ?? '',
      uploadedFiles: json['uploaded_files'] != null
          ? List<String>.from(json['uploaded_files'] as List)
          : [],
    );
  }
}