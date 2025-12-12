import 'package:equatable/equatable.dart';

class TeknisiTicketResponse extends Equatable {
  final int total;
  final List<TeknisiTicketModel> data;

  const TeknisiTicketResponse({
    required this.total,
    required this.data,
  });

  @override
  List<Object?> get props => [total, data];
}

class TeknisiTicketModel extends Equatable {
  final String id;
  final String ticketCode;
  final String title;
  final String description;
  final String priority;
  final String status;
  final String source;
  final String statusTeknisi;
  final String createdAt;
  final String requestType; // ✅ Field Baru

  final String pengerjaanAwal;
  final String pengerjaanAkhir;
  
  final String? pengerjaanAwalTeknisi;
  final String? pengerjaanAkhirTeknisi;

  final TeknisiCreatorModel creator;
  final TeknisiAssetModel? asset;
  final List<String> files;

  const TeknisiTicketModel({
    required this.id,
    required this.ticketCode,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.source,
    required this.statusTeknisi,
    required this.createdAt,
    required this.requestType, // ✅
    required this.pengerjaanAwal,
    required this.pengerjaanAkhir,
    this.pengerjaanAwalTeknisi,
    this.pengerjaanAkhirTeknisi,
    required this.creator,
    this.asset,
    required this.files,
  });

  @override
  List<Object?> get props => [
        id,
        ticketCode,
        title,
        description,
        priority,
        status,
        source,
        statusTeknisi,
        createdAt,
        requestType, // ✅
        pengerjaanAwal,
        pengerjaanAkhir,
        pengerjaanAwalTeknisi,
        pengerjaanAkhirTeknisi,
        creator,
        asset,
        files,
      ];
}

// ... (TeknisiCreatorModel & TeknisiAssetModel tetap sama, tidak perlu diubah)
// Pastikan field subkategoriNama di TeknisiAssetModel sudah ada dari langkah sebelumnya
class TeknisiCreatorModel extends Equatable {
  final String userId;
  final String fullName;
  final String email;
  final String? profileUrl;

  const TeknisiCreatorModel({
    required this.userId,
    required this.fullName,
    required this.email,
    this.profileUrl,
  });

  @override
  List<Object?> get props => [userId, fullName, email, profileUrl];
}

class TeknisiAssetModel extends Equatable {
  final int? assetId;
  final String namaAsset;
  final String kodeBmd;
  final String nomorSeri;
  final String kategori;
  final String? subkategoriNama;
  final String jenisAsset;
  final String? lokasi;

  const TeknisiAssetModel({
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