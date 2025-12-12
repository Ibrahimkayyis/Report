import 'package:equatable/equatable.dart';

// Enum untuk mengidentifikasi tipe form/tiket (penting untuk rendering PDF)
enum TicketFormType { 
  reportingMasyarakat, 
  reportingPegawai, 
  serviceRequest 
}

class TicketDetailData extends Equatable {
  // Data Wajib (dari semua form, untuk Success Card)
  final String ticketNumber;
  final String status;
  final String opdName; // OPD Tujuan (Masyarakat) atau Judul Permintaan (Pegawai Service Req)
  final String title; // Judul Pelaporan/Pengajuan
  final String description; // Deskripsi Masalah/Kebutuhan
  final String serviceTypeLabel; // e.g., 'Pelaporan Online', 'Pengajuan Layanan'
  final TicketFormType formType; // Tipe Form yang diisi
  
  // Data Tanggal/Waktu
  final String dateTime; 

  // Data Aset/Lokasi (Opsional, khusus Pegawai)
  final String? assetName; 
  final String? nomorSeri;
  final String? kategoriAset;
  final String? subKategori;
  final String? lokasiKejadian; // Lokasi Insiden (Pelaporan) atau Penempatan (Pengajuan)
  
  // Data Tambahan (Masyarakat)
  final String? ditujukanKeOPD; 

  const TicketDetailData({
    required this.ticketNumber,
    required this.status,
    required this.opdName, 
    required this.title,
    required this.description,
    required this.serviceTypeLabel,
    required this.formType,
    required this.dateTime,
    
    // Opsional
    this.assetName,
    this.nomorSeri,
    this.kategoriAset,
    this.subKategori,
    this.lokasiKejadian,
    this.ditujukanKeOPD,
  });

  @override
  List<Object?> get props => [
        ticketNumber, status, opdName, title, description, serviceTypeLabel,
        formType, dateTime, assetName, nomorSeri, kategoriAset, subKategori,
        lokasiKejadian, ditujukanKeOPD
      ];
}