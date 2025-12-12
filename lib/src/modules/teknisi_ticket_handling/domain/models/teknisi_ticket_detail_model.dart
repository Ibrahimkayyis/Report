import 'package:equatable/equatable.dart';

class TeknisiTicketDetailModel extends Equatable {
  final String id;
  final String ticketCode;
  final String title;
  final String description;
  final String priority;
  final String status; // Status Sistem (assigned to teknisi)
  final String ticketSource;
  final String createdAt;
  
  // Status View
  final String statusTicketPengguna;
  final String statusTicketSeksi;
  final String statusTicketTeknisi; // Draft, Diproses, Selesai

  // Jadwal
  final String pengerjaanAwal;
  final String pengerjaanAkhir;
  final String? pengerjaanAwalTeknisi;
  final String? pengerjaanAkhirTeknisi;

  // Data Tambahan (Lokasi & Solusi)
  final String? lokasiKejadian;
  final String? expectedResolution;

  // Risiko & Dampak (Nullable)
  final int? kategoriRisikoId;
  final String? kategoriRisikoNama;
  final String? kategoriRisikoSeleraNegatif;
  final String? kategoriRisikoSeleraPositif;
  final int? areaDampakId;
  final String? areaDampakNama;
  final String? deskripsiPengendalian;

  // Nested Objects
  final TicketCreatorModel creator;
  final TicketAssetModel? asset;
  final List<String> files; // List URL file lampiran (disederhanakan jadi String URL/Path)

  const TeknisiTicketDetailModel({
    required this.id,
    required this.ticketCode,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.ticketSource,
    required this.createdAt,
    required this.statusTicketPengguna,
    required this.statusTicketSeksi,
    required this.statusTicketTeknisi,
    required this.pengerjaanAwal,
    required this.pengerjaanAkhir,
    this.pengerjaanAwalTeknisi,
    this.pengerjaanAkhirTeknisi,
    this.lokasiKejadian,
    this.expectedResolution,
    this.kategoriRisikoId,
    this.kategoriRisikoNama,
    this.kategoriRisikoSeleraNegatif,
    this.kategoriRisikoSeleraPositif,
    this.areaDampakId,
    this.areaDampakNama,
    this.deskripsiPengendalian,
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
        ticketSource,
        createdAt,
        statusTicketPengguna,
        statusTicketSeksi,
        statusTicketTeknisi,
        pengerjaanAwal,
        pengerjaanAkhir,
        pengerjaanAwalTeknisi,
        pengerjaanAkhirTeknisi,
        lokasiKejadian,
        expectedResolution,
        kategoriRisikoId,
        kategoriRisikoNama,
        kategoriRisikoSeleraNegatif,
        kategoriRisikoSeleraPositif,
        areaDampakId,
        areaDampakNama,
        deskripsiPengendalian,
        creator,
        asset,
        files,
      ];
}

/// Model Pelapor (Khusus Detail)
class TicketCreatorModel extends Equatable {
  final String userId;
  final String fullName;
  final String email;
  final String? profileUrl;

  const TicketCreatorModel({
    required this.userId,
    required this.fullName,
    required this.email,
    this.profileUrl,
  });

  @override
  List<Object?> get props => [userId, fullName, email, profileUrl];
}

/// Model Aset (Khusus Detail - field lebih lengkap)
class TicketAssetModel extends Equatable {
  final int? assetId;
  final String namaAsset;
  final String kodeBmd;
  final String nomorSeri;
  final String kategori;
  final int? subkategoriId;
  final String? subkategoriNama;
  final String jenisAsset;
  final String? lokasiAsset;
  final int? opdIdAsset;

  const TicketAssetModel({
    this.assetId,
    required this.namaAsset,
    required this.kodeBmd,
    required this.nomorSeri,
    required this.kategori,
    this.subkategoriId,
    this.subkategoriNama,
    required this.jenisAsset,
    this.lokasiAsset,
    this.opdIdAsset,
  });

  @override
  List<Object?> get props => [
        assetId,
        namaAsset,
        kodeBmd,
        nomorSeri,
        kategori,
        subkategoriId,
        subkategoriNama,
        jenisAsset,
        lokasiAsset,
        opdIdAsset,
      ];
}