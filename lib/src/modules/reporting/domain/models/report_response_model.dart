import 'package:equatable/equatable.dart';

class ReportResponseModel extends Equatable {
  // Data Dasar (Langsung dari root level atau dari ticket)
  final String message;
  final String ticketId;
  final String ticketCode;
  final String status; // Status Sistem (misal: Open)
  final String statusTicketPengguna; // Status User (misal: Menunggu Diproses)
  final String createdAt;
  
  // Data Detail Tiket/Form
  final String title;
  final String description;
  final String? expectedResolution;
  final String opdName; // OPD Tujuan
  final String lokasiKejadian; // Lokasi Kejadian (di luar data aset)

  // Data Detail Aset (Sesuai field PDF)
  final String? namaAsset;
  final String? nomorSeriAsset;
  final String? kategoriAsset;
  final String? subKategoriNamaAsset;
  final String? jenisAsset;
  final String? kodeBmdAsset;
  
  final List<String> uploadedFiles; // Link files

  const ReportResponseModel({
    required this.message,
    required this.ticketId,
    required this.ticketCode,
    required this.status,
    required this.statusTicketPengguna,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.opdName,
    required this.lokasiKejadian,
    this.expectedResolution,
    this.namaAsset,
    this.nomorSeriAsset,
    this.kategoriAsset,
    this.subKategoriNamaAsset,
    this.jenisAsset,
    this.kodeBmdAsset,
    this.uploadedFiles = const [],
  });

  @override
  List<Object?> get props => [
        message, ticketId, ticketCode, status, statusTicketPengguna, createdAt,
        title, description, opdName, lokasiKejadian, expectedResolution,
        namaAsset, nomorSeriAsset, kategoriAsset, subKategoriNamaAsset,
        jenisAsset, kodeBmdAsset, uploadedFiles,
      ];
}