import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_asset_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_creator_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_rating_model.dart'; // ✅ Pastikan Import ini
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';

class ActivityMapper {
  static ActivityModel fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      priority: json['priority'] as String?,
      status: json['status'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      workStartDate: json['pengerjaan_awal'] as String?,
      workEndDate: json['pengerjaan_akhir'] as String?,
      techWorkStartDate: json['pengerjaan_awal_teknisi'] as String?,
      techWorkEndDate: json['pengerjaan_akhir_teknisi'] as String?,
      userStatus: json['status_ticket_pengguna'] as String? ?? '',
      sectionStatus: json['status_ticket_seksi'] as String? ?? '',
      technicianStatus: json['status_ticket_teknisi'] as String?,
      
      // ✅ REFACTOR: Gunakan _mapRating agar konsisten & return TicketRatingModel
      rating: json['rating'] != null ? _mapRating(json['rating']) : null,
    );
  }

  static TrackTicketModel fromTrackTicketJson(Map<String, dynamic> json) {
    return TrackTicketModel(
      ticketCode: json['ticket_code'] as String? ?? '',
      userStatus: json['status_ticket_pengguna'] as String? ?? '',
      requestType: json['request_type'] as String? ?? '',
      opdId: json['opd_id'] is int
          ? json['opd_id'] as int
          : int.tryParse(json['opd_id'].toString()) ?? 0,
      opdName: json['opd_name'] as String? ?? '',
    );
  }

  static TicketDetailModel fromDetailJson(Map<String, dynamic> json) {
    return TicketDetailModel(
      ticketId: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      priority: json['priority'] as String? ?? '',
      status: json['status'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      lokasiKejadian: json['lokasi_kejadian'] as String?,
      expectedResolution: json['expected_resolution'] as String?,
      pengerjaanAwal: json['pengerjaan_awal'] as String?,
      pengerjaanAkhir: json['pengerjaan_akhir'] as String?,
      statusTicketPengguna: json['status_ticket_pengguna'] as String?,
      statusTicketSeksi: json['status_ticket_seksi'] as String?,
      statusTicketTeknisi: json['status_ticket_teknisi'] as String?,
      
      // Menggunakan helper yang sama
      rating: json['rating'] != null ? _mapRating(json['rating']) : null,
      
      creator: json['creator'] != null ? _mapCreator(json['creator']) : null,
      asset: json['asset'] != null ? _mapAsset(json['asset']) : null,
      files: json['files'] != null
          ? List<String>.from(json['files'] as List)
          : [],
    );
  }

  static RatingSubmissionModel fromSubmissionJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    return RatingSubmissionModel(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      ratingId: data['rating_id'] as String? ?? '',
      ticketId: data['ticket_id'] as String? ?? '',
      rating: (data['rating'] as num?)?.toInt() ?? 0,
      comment: data['comment'] as String?,
      createdAt: data['created_at'] as String? ?? '',
    );
  }

  // ✅ Helper ini sekarang mengembalikan TicketRatingModel yang digunakan di ActivityModel
  static TicketRatingModel _mapRating(Map<String, dynamic> json) {
    return TicketRatingModel(
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  static TicketCreatorModel _mapCreator(Map<String, dynamic> json) {
    return TicketCreatorModel(
      userId: json['user_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      profile: json['profile'] as String?,
    );
  }

  static TicketAssetModel _mapAsset(Map<String, dynamic> json) {
    return TicketAssetModel(
      assetId: (json['asset_id'] as num?)?.toInt(),
      namaAsset: json['nama_asset'] as String?,
      kodeBmd: json['kode_bmd'] as String?,
      nomorSeri: json['nomor_seri'] as String?,
      kategori: json['kategori'] as String?,
      subkategoriId: (json['subkategori_id'] as num?)?.toInt(),
      subkategoriNama: json['subkategori_nama'] as String?,
      jenisAsset: json['jenis_asset'] as String?,
      lokasiAsset: json['lokasi_asset'] as String?,
      opdIdAsset: (json['opd_id_asset'] as num?)?.toInt(),
    );
  }
}