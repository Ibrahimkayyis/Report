import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_asset_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_creator_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_detail_model.dart';
import 'package:report/src/modules/report_activity/domain/models/ticket_rating_model.dart'; 
import 'package:report/src/modules/report_activity/domain/models/track_ticket_model.dart';

class ActivityMapper {
  // ... (fromJson & fromTrackTicketJson tetap sama) ...
  static ActivityModel fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['ticket_id']?.toString() ?? '',
      ticketCode: json['ticket_code']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      priority: json['priority']?.toString(),
      status: json['status']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
      workStartDate: json['pengerjaan_awal']?.toString(),
      workEndDate: json['pengerjaan_akhir']?.toString(),
      techWorkStartDate: json['pengerjaan_awal_teknisi']?.toString(),
      techWorkEndDate: json['pengerjaan_akhir_teknisi']?.toString(),
      userStatus: json['status_ticket_pengguna']?.toString() ?? '',
      sectionStatus: json['status_ticket_seksi']?.toString() ?? '',
      technicianStatus: json['status_ticket_teknisi']?.toString(),
      rating: json['rating'] is Map<String, dynamic> 
          ? _mapRating(json['rating'] as Map<String, dynamic>) 
          : null,
    );
  }

  static TrackTicketModel fromTrackTicketJson(Map<String, dynamic> json) {
    return TrackTicketModel(
      ticketCode: json['ticket_code']?.toString() ?? '',
      userStatus: json['status_ticket_pengguna']?.toString() ?? '',
      requestType: json['request_type']?.toString() ?? '',
      opdId: int.tryParse(json['opd_id']?.toString() ?? '0') ?? 0,
      opdName: json['opd_name']?.toString() ?? '',
    );
  }

  // ✅ PERBAIKAN UTAMA DI SINI
  static TicketDetailModel fromDetailJson(Map<String, dynamic> json) {
    // Helper safe string
    String? safeString(dynamic val) => val?.toString();

    return TicketDetailModel(
      ticketId: safeString(json['ticket_id']) ?? '',
      ticketCode: safeString(json['ticket_code']) ?? '',
      title: safeString(json['title']) ?? '',
      description: safeString(json['description']) ?? '',
      priority: safeString(json['priority']) ?? '',
      status: safeString(json['status']) ?? '',
      createdAt: safeString(json['created_at']) ?? '',
      lokasiKejadian: safeString(json['lokasi_kejadian']),
      expectedResolution: safeString(json['expected_resolution']),
      pengerjaanAwal: safeString(json['pengerjaan_awal']),
      pengerjaanAkhir: safeString(json['pengerjaan_akhir']),
      statusTicketPengguna: safeString(json['status_ticket_pengguna']),
      statusTicketSeksi: safeString(json['status_ticket_seksi']),
      statusTicketTeknisi: safeString(json['status_ticket_teknisi']),
      
      // ✅ Cek tipe data sebelum mapping nested object
      rating: json['rating'] is Map<String, dynamic> 
          ? _mapRating(json['rating'] as Map<String, dynamic>) 
          : null,
      
      creator: json['creator'] is Map<String, dynamic> 
          ? _mapCreator(json['creator'] as Map<String, dynamic>) 
          : null,
      
      asset: json['asset'] is Map<String, dynamic> 
          ? _mapAsset(json['asset'] as Map<String, dynamic>) 
          : null,
      
      files: json['files'] is List
          ? (json['files'] as List).map((e) => e.toString()).toList()
          : [],
    );
  }

  static RatingSubmissionModel fromSubmissionJson(Map<String, dynamic> json) {
    final data = json['data'] is Map<String, dynamic> 
        ? json['data'] as Map<String, dynamic> 
        : <String, dynamic>{};
        
    return RatingSubmissionModel(
      status: json['status']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      ratingId: data['rating_id']?.toString() ?? '',
      ticketId: data['ticket_id']?.toString() ?? '',
      rating: int.tryParse(data['rating']?.toString() ?? '0') ?? 0,
      comment: data['comment']?.toString(),
      createdAt: data['created_at']?.toString() ?? '',
    );
  }

  static TicketRatingModel _mapRating(Map<String, dynamic> json) {
    return TicketRatingModel(
      rating: int.tryParse(json['rating']?.toString() ?? '0') ?? 0,
      comment: json['comment']?.toString(),
      createdAt: json['created_at']?.toString(),
    );
  }

  static TicketCreatorModel _mapCreator(Map<String, dynamic> json) {
    return TicketCreatorModel(
      userId: json['user_id']?.toString() ?? '',
      fullName: json['full_name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      profile: json['profile']?.toString(),
    );
  }

  static TicketAssetModel _mapAsset(Map<String, dynamic> json) {
    return TicketAssetModel(
      assetId: int.tryParse(json['asset_id']?.toString() ?? '0'),
      namaAsset: json['nama_asset']?.toString(),
      kodeBmd: json['kode_bmd']?.toString(),
      nomorSeri: json['nomor_seri']?.toString(),
      kategori: json['kategori']?.toString(),
      subkategoriId: int.tryParse(json['subkategori_id']?.toString() ?? '0'),
      subkategoriNama: json['subkategori_nama']?.toString(),
      jenisAsset: json['jenis_asset']?.toString(),
      lokasiAsset: json['lokasi_asset']?.toString(),
      opdIdAsset: int.tryParse(json['opd_id_asset']?.toString() ?? '0'),
    );
  }
}