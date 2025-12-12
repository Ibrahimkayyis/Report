import 'package:equatable/equatable.dart';

class ServiceRequestResponseModel extends Equatable {
  final String message;
  final String ticketId;
  final String ticketCode;
  final String title;
  final String serviceType; // Map dari 'jenis_layanan'
  
  // ✅ Data Detail Pengajuan (untuk PDF)
  final String opdName; // Nama OPD Tujuan
  final String? location; // Lokasi Penempatan (API: lokasi_penempatan)
  final String description; // Deskripsi Kebutuhan
  final String? expectedResolution; // Harapan Realisasi

  const ServiceRequestResponseModel({
    required this.message,
    required this.ticketId,
    required this.ticketCode,
    required this.title,
    required this.serviceType,
    // ✅ NEW FIELDS
    required this.opdName,
    required this.description,
    this.location,
    this.expectedResolution,
  });

  @override
  List<Object?> get props => [
        message,
        ticketId,
        ticketCode,
        title,
        serviceType,
        opdName,
        location,
        description,
        expectedResolution,
      ];
}