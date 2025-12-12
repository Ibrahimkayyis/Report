import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

class ReportResponseMapper {
  static ReportResponseModel fromJson(Map<String, dynamic> json) {
    // API response Pegawai bersarang di bawah key 'ticket'
    final ticketData = json['ticket'] as Map<String, dynamic>? ?? {};

    // Ambil data detail aset/form dari ticketData
    final title = ticketData['title'] as String? ?? '';
    final description = ticketData['description'] as String? ?? '';
    final opdName = ticketData['opd_nama'] as String? ?? 'OPD Tidak Diketahui';
    final lokasiKejadian = ticketData['lokasi_kejadian'] as String? ?? '';
    final uploadedFilesJson = json['uploaded_files'] as List<dynamic>? ?? [];

    return ReportResponseModel(
      message: json['message'] as String? ?? 'Laporan berhasil dibuat',
      
      // Data Dasar
      ticketId: ticketData['ticket_id'] as String? ?? '',
      ticketCode: ticketData['ticket_code'] as String? ?? '-',
      status: ticketData['status'] as String? ?? 'Open',
      statusTicketPengguna: ticketData['status_ticket_pengguna'] as String? ?? 'Menunggu Diproses',
      createdAt: ticketData['created_at'] as String? ?? DateTime.now().toIso8601String(),
      
      // Data Detail Form
      title: title,
      description: description,
      opdName: opdName,
      lokasiKejadian: lokasiKejadian,
      expectedResolution: ticketData['expected_resolution'] as String?,
      
      // Data Detail Aset
      namaAsset: ticketData['nama_asset'] as String?,
      nomorSeriAsset: ticketData['nomor_seri_asset'] as String?,
      kategoriAsset: ticketData['kategori_asset'] as String?,
      subKategoriNamaAsset: ticketData['subkategori_nama_asset'] as String?,
      jenisAsset: ticketData['jenis_asset'] as String?,
      kodeBmdAsset: ticketData['kode_bmd_asset'] as String?,

      // Files
      uploadedFiles: uploadedFilesJson.map((e) => e.toString()).toList(),
    );
  }
}