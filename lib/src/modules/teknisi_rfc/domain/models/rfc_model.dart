import 'package:equatable/equatable.dart';

/// ✅ Enum untuk membedakan tipe RFC
enum RfcType {
  incidentRepeat,
  changeRequest,
}

class RfcModel extends Equatable {
  // ✅ Field baru sebagai penanda
  final RfcType type;

  // --- Field Umum (Ada di kedua endpoint) ---
  final String localRfcId;
  final int? traceRfcId;
  final String judulPerubahan;
  final String kategoriAset;
  final int idAset;
  final String deskripsiAset;
  final String alasanPerubahan;
  final String dampakPerubahan;
  final String dampakJikaTidak;
  final int biayaEstimasi;
  final String namaPemohon;
  final String opdPemohon;
  final int riskScoreAset;
  final String createdAt;
  
  // Field status & approval
  final String? statusTrace;
  final String? rencanaImplementasi;
  final String? alasanPenolakan;
  final String? rencanaRollback;
  final String? lampiran;

  // --- Field Khusus Change Request ---
  final String? ticketId;
  final String? ticketCode;
  final String? ticketStatus;

  const RfcModel({
    required this.type, // ✅ Wajib diisi saat inisialisasi
    required this.localRfcId,
    this.traceRfcId,
    required this.judulPerubahan,
    required this.kategoriAset,
    required this.idAset,
    required this.deskripsiAset,
    required this.alasanPerubahan,
    required this.dampakPerubahan,
    required this.dampakJikaTidak,
    required this.biayaEstimasi,
    required this.namaPemohon,
    required this.opdPemohon,
    required this.riskScoreAset,
    required this.createdAt,
    this.statusTrace,
    this.rencanaImplementasi,
    this.alasanPenolakan,
    this.rencanaRollback,
    this.lampiran,
    // Change Request fields
    this.ticketId,
    this.ticketCode,
    this.ticketStatus,
  });

  @override
  List<Object?> get props => [
        type, // ✅ Masukkan ke props untuk perbandingan
        localRfcId,
        traceRfcId,
        judulPerubahan,
        kategoriAset,
        idAset,
        deskripsiAset,
        alasanPerubahan,
        dampakPerubahan,
        dampakJikaTidak,
        biayaEstimasi,
        namaPemohon,
        opdPemohon,
        riskScoreAset,
        createdAt,
        statusTrace,
        rencanaImplementasi,
        alasanPenolakan,
        rencanaRollback,
        lampiran,
        ticketId,
        ticketCode,
        ticketStatus,
      ];
}