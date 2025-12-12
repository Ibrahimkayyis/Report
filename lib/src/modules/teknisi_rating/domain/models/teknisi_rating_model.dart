import 'package:equatable/equatable.dart';

/// Wrapper untuk Response API (Total + Data List)
class TeknisiRatingResponse extends Equatable {
  final int total;
  final List<TeknisiRatingModel> data;

  const TeknisiRatingResponse({
    required this.total,
    required this.data,
  });

  @override
  List<Object?> get props => [total, data];
}

/// Model Utama Rating
class TeknisiRatingModel extends Equatable {
  final String id;
  final String ticketCode;
  final String title;
  final String status; // selesai, dll
  final int rating; // 1-5
  final String comment;
  final String ratedAt;
  final String priority;
  final String requestType; // pelaporan_online / pengajuan_pelayanan (Penting untuk Tab)
  
  // Data Waktu Pengerjaan
  final String pengerjaanAwal;
  final String pengerjaanAkhir;
  final String? pengerjaanAwalTeknisi;
  final String? pengerjaanAkhirTeknisi;

  // Data Tambahan (Detail Only - Nullable)
  final String? description;
  final String? lokasiKejadian;
  final String? expectedResolution;

  // Nested Objects
  final RatingCreatorModel creator;
  final RatingAssetModel? asset;

  const TeknisiRatingModel({
    required this.id,
    required this.ticketCode,
    required this.title,
    required this.status,
    required this.rating,
    required this.comment,
    required this.ratedAt,
    required this.priority,
    required this.requestType,
    required this.pengerjaanAwal,
    required this.pengerjaanAkhir,
    this.pengerjaanAwalTeknisi,
    this.pengerjaanAkhirTeknisi,
    this.description,
    this.lokasiKejadian,
    this.expectedResolution,
    required this.creator,
    this.asset,
  });

  @override
  List<Object?> get props => [
        id,
        ticketCode,
        title,
        status,
        rating,
        comment,
        ratedAt,
        priority,
        requestType,
        pengerjaanAwal,
        pengerjaanAkhir,
        pengerjaanAwalTeknisi,
        pengerjaanAkhirTeknisi,
        description,
        lokasiKejadian,
        expectedResolution,
        creator,
        asset,
      ];
}

/// Model Pelapor (Pemberi Rating)
class RatingCreatorModel extends Equatable {
  final String userId;
  final String fullName;
  final String email;
  final String? profileUrl;

  const RatingCreatorModel({
    required this.userId,
    required this.fullName,
    required this.email,
    this.profileUrl,
  });

  @override
  List<Object?> get props => [userId, fullName, email, profileUrl];
}

/// Model Aset Terkait
class RatingAssetModel extends Equatable {
  final int? assetId;
  final String namaAsset;
  final String kodeBmd;
  final String nomorSeri;
  final String kategori; // ti, non-ti
  final String? subkategoriNama; // Server, Laptop, dll
  final String jenisAsset; // barang, dll
  final String? lokasi;

  const RatingAssetModel({
    this.assetId,
    required this.namaAsset,
    required this.kodeBmd,
    required this.nomorSeri,
    required this.kategori,
    this.subkategoriNama,
    required this.jenisAsset,
    this.lokasi,
  });

  @override
  List<Object?> get props => [
        assetId,
        namaAsset,
        kodeBmd,
        nomorSeri,
        kategori,
        subkategoriNama,
        jenisAsset,
        lokasi,
      ];
}