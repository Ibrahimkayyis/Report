import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';

class TeknisiRatingMapper {
  /// Mapping Response List (Total + Data)
  static TeknisiRatingResponse fromResponse(Map<String, dynamic> json) {
    return TeknisiRatingResponse(
      total: json['total'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Mapping Single Item (Digunakan untuk List Item & Detail Page)
  static TeknisiRatingModel fromJson(Map<String, dynamic> json) {
    return TeknisiRatingModel(
      id: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '-',
      title: json['title'] as String? ?? 'Tanpa Judul',
      status: json['status'] as String? ?? 'Unknown',
      // Safe parsing untuk integer
      rating: json['rating'] is int
          ? json['rating']
          : int.tryParse(json['rating']?.toString() ?? '0') ?? 0,
      comment: json['comment'] as String? ?? '-',
      ratedAt: json['rated_at'] as String? ?? '',
      priority: json['priority'] as String? ?? 'Low',
      
      // ✅ PENTING: Mapping Request Type untuk Tab
      requestType: json['request_type'] as String? ?? 'pelaporan_online',

      pengerjaanAwal: json['pengerjaan_awal'] as String? ?? '',
      pengerjaanAkhir: json['pengerjaan_akhir'] as String? ?? '',
      pengerjaanAwalTeknisi: json['pengerjaan_awal_teknisi'] as String?,
      pengerjaanAkhirTeknisi: json['pengerjaan_akhir_teknisi'] as String?,

      // Field Khusus Detail (Nullable di list)
      description: json['description'] as String?,
      lokasiKejadian: json['lokasi_kejadian'] as String?,
      expectedResolution: json['expected_resolution'] as String?,

      // Nested Objects
      creator: _mapCreator(json['creator']),
      asset: _mapAsset(json['asset']),
    );
  }

  static RatingCreatorModel _mapCreator(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return const RatingCreatorModel(
        userId: '',
        fullName: 'Unknown User',
        email: '-',
      );
    }
    return RatingCreatorModel(
      userId: json['user_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? 'Unknown User',
      email: json['email'] as String? ?? '-',
      profileUrl: json['profile'] as String?,
    );
  }

  static RatingAssetModel? _mapAsset(dynamic json) {
    if (json is! Map<String, dynamic>) return null;
    
    // Jika asset_id null, anggap aset tidak ada
    if (json['asset_id'] == null) return null;

    return RatingAssetModel(
      assetId: json['asset_id'] is int
          ? json['asset_id']
          : int.tryParse(json['asset_id'].toString()),
      namaAsset: json['nama_asset'] as String? ?? '-',
      kodeBmd: json['kode_bmd'] as String? ?? '-',
      nomorSeri: json['nomor_seri'] as String? ?? '-',
      kategori: json['kategori'] as String? ?? '-',
      subkategoriNama: json['subkategori_nama'] as String?,
      jenisAsset: json['jenis_asset'] as String? ?? '-',
      lokasi: json['lokasi_asset'] as String?,
    );
  }
}