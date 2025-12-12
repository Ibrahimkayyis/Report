import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:report/src/core/download/download_service.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

@LazySingleton(as: DownloadService)
class PdfDownloadService implements DownloadService {
  
  @override
  Future<String> generatePdfTicket({
    required dynamic data,
    required TicketType type,
  }) async {
    final pdf = pw.Document();

    // 1. Load Assets (Logo, Icons, Fonts)
    // Pastikan Anda mendaftarkan logo di pubspec.yaml assets
    final logoImage = await _loadAssetImage('assets/images/logo_report.png'); 
    // Gunakan icon check sederhana atau load image icon
    // Kita gunakan standard font helvetica untuk simplicity, 
    // jika butuh custom font harus load ttf.

    // 2. Siapkan Data untuk Rendering (Mapping Data)
    final Map<String, String> details = _mapDataToDetails(data, type);
    final String ticketNumber = _getTicketNumber(data, type);
    final String opdName = _getOpdName(data, type);
    final String serviceTypeLabel = _getServiceTypeLabel(type);
    final String titleHeader = "Tiket Anda Berhasil Dibuat";
    final String subTitleCard = type == TicketType.pegawaiRequest 
        ? "Permohonan Anda Telah Berhasil Dikirim"
        : "Laporan Anda Telah Berhasil Dikirim";

    // 3. Buat Halaman PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // --- HEADER ---
              _buildHeader(logoImage),
              pw.SizedBox(height: 20),
              
              // --- TITLE ---
              pw.Center(
                child: pw.Text(
                  titleHeader,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),

              // --- MAIN CARD ---
              _buildSuccessCard(
                logoImage, 
                subTitleCard, 
                ticketNumber, 
                serviceTypeLabel, 
                opdName
              ),
              pw.SizedBox(height: 30),

              // --- DETAIL SECTION ---
              pw.Text(
                "Detail tiket:",
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 10),
              _buildDetailList(details),
              
              pw.SizedBox(height: 30),

              // --- FOOTER ---
              _buildFooter(),
            ],
          );
        },
      ),
    );

    // 4. Simpan File
    return await _savePdfFile(pdf, ticketNumber);
  }

  // ===========================================================================
  // 🎨 PDF WIDGET BUILDERS (Layouting)
  // ===========================================================================

  pw.Widget _buildHeader(pw.MemoryImage? logo) {
    return pw.Column(
      children: [
        pw.Row(
          children: [
            if (logo != null) pw.Image(logo, width: 40),
            pw.SizedBox(width: 10),
            pw.Text(
              "REPORT",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex("#B71C1C"), // Merah Logo
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Divider(color: PdfColors.grey300, thickness: 1),
      ],
    );
  }

  pw.Widget _buildSuccessCard(
    pw.MemoryImage? icon,
    String subtitle,
    String ticketCode,
    String typeLabel,
    String opdName,
  ) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300, width: 1),
        borderRadius: pw.BorderRadius.circular(16),
      ),
      child: pw.Column(
        children: [
          if (icon != null) pw.Image(icon, width: 40), // Placeholder icon success
          pw.SizedBox(height: 10),
          pw.Text(
            subtitle,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            "Terima kasih atas laporan Anda. Silakan pantau perkembangan via menu Cek Status Layanan.",
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 20),
          pw.Text("No. Tiket:", style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 4),
          
          // Ticket Pill
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: pw.BoxDecoration(
              color: PdfColor.fromHex("#0D47A1"), // Biru Tua
              borderRadius: pw.BorderRadius.circular(8),
            ),
            child: pw.Text(
              ticketCode,
              style: pw.TextStyle(
                color: PdfColors.white,
                fontWeight: pw.FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          pw.SizedBox(height: 20),

          // Info Row (Jenis Layanan & OPD)
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              _buildSmallInfo("Jenis Layanan:", typeLabel),
              pw.SizedBox(width: 30),
              _buildSmallInfo("OPD Tujuan:", opdName),
            ],
          )
        ],
      ),
    );
  }

  pw.Widget _buildSmallInfo(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label, style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
        pw.Text(value, style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  pw.Widget _buildDetailList(Map<String, String> details) {
    return pw.Column(
      children: details.entries.map((entry) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 6),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 140, 
                child: pw.Text(entry.key, style: const pw.TextStyle(fontSize: 10))
              ),
              pw.Text(": ", style: const pw.TextStyle(fontSize: 10)),
              pw.Expanded(
                child: pw.Text(entry.value, style: const pw.TextStyle(fontSize: 10))
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  pw.Widget _buildFooter() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Mohon simpan nomor tiket Anda untuk melacak status penyelesaian.",
          style: const pw.TextStyle(fontSize: 10),
        ),
        pw.Text(
          "Tim kami akan segera menindaklanjuti laporan Anda.",
          style: const pw.TextStyle(fontSize: 10),
        ),
        pw.SizedBox(height: 10),
        pw.RichText(
          text: pw.TextSpan(
            text: "Anda dapat memantau progres tiket di menu ",
            style: const pw.TextStyle(fontSize: 10),
            children: [
              pw.TextSpan(
                text: "Cek Status Layanan",
                style: pw.TextStyle(
                  color: PdfColor.fromHex("#0D47A1"),
                  decoration: pw.TextDecoration.underline,
                ),
              ),
              const pw.TextSpan(text: "."),
            ],
          ),
        ),
        pw.SizedBox(height: 30),
        pw.Divider(color: PdfColors.grey300, thickness: 0.5),
        pw.SizedBox(height: 10),
        pw.Text(
          "© ${DateTime.now().year} REPORT - Sistem Pelaporan Layanan.", // ✅ Ganti dengan strip biasa (-)
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
        ),
        pw.Text(
          "Dokumen dicetak otomatis dan sah tanpa tanda tangan.",
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
        ),
      ],
    );
  }

  // ===========================================================================
  // ⚙️ LOGIC HELPERS & MAPPERS
  // ===========================================================================

  /// Mapping data model ke Key-Value untuk Detail Section
  Map<String, String> _mapDataToDetails(dynamic data, TicketType type) {
    final Map<String, String> details = {};
    final dateFormat = DateFormat('dd-MM-yyyy / HH.mm a');

    // Field Umum
    if (type == TicketType.masyarakatReporting) {
      final d = data as MasyarakatReportResponseModel;
      details['Nomor Tiket'] = d.ticketCode;
      details['Tanggal / waktu laporan'] = dateFormat.format(DateTime.parse(d.createdAt));
      details['Jenis Layanan'] = "Pelaporan Online";
      details['Ditujukan ke OPD'] = d.opdName;
      details['Judul Pelaporan'] = d.title;
      // Masyarakat tidak ada detail aset
    } 
    else if (type == TicketType.pegawaiReporting) {
      final d = data as ReportResponseModel;
      details['Nomor Tiket'] = d.ticketCode;
      details['Tanggal / waktu laporan'] = dateFormat.format(DateTime.parse(d.createdAt));
      details['Jenis Layanan'] = "Pelaporan Online";
      details['Ditujukan ke OPD'] = d.opdName;
      details['Judul Pelaporan'] = d.title;
      
      // Detail Aset Pegawai
      details['Data Aset'] = d.namaAsset ?? '-';
      details['Nomor Seri'] = d.nomorSeriAsset ?? '-';
      details['Kategori Aset'] = d.kategoriAsset ?? '-';
      details['Sub Kategori Aset'] = d.subKategoriNamaAsset ?? '-';
      details['Jenis Aset'] = d.jenisAsset ?? '-';
      details['Nama Aset'] = d.namaAsset ?? '-';
      details['Lokasi Kejadian'] = d.lokasiKejadian;
    } 
    else if (type == TicketType.pegawaiRequest) {
      final d = data as ServiceRequestResponseModel;
      details['Nomor Tiket'] = d.ticketCode;
      // ServiceRequest belum punya created_at di model, pakai current time jika null
      details['Tanggal / waktu laporan'] = dateFormat.format(DateTime.now()); 
      details['Jenis Layanan'] = "Pengajuan Pelayanan";
      details['Ditujukan ke OPD'] = d.opdName;
      details['Judul Pengajuan'] = d.title;
      
      // Detail Request
      // Asumsi: 'nama_asset' di API pengajuan adalah jenis barang yang diminta
      // details['Barang yang diminta'] = ... (Butuh mapping ID ke nama jika di model cuma ID)
      details['Lokasi Penempatan'] = d.location ?? '-';
      details['Deskripsi Kebutuhan'] = d.description;
      details['Harapan Realisasi'] = d.expectedResolution ?? '-';
    }

    return details;
  }

  String _getTicketNumber(dynamic data, TicketType type) {
    if (type == TicketType.masyarakatReporting) return (data as MasyarakatReportResponseModel).ticketCode;
    if (type == TicketType.pegawaiReporting) return (data as ReportResponseModel).ticketCode;
    if (type == TicketType.pegawaiRequest) return (data as ServiceRequestResponseModel).ticketCode;
    return "-";
  }

  String _getOpdName(dynamic data, TicketType type) {
    if (type == TicketType.masyarakatReporting) return (data as MasyarakatReportResponseModel).opdName;
    if (type == TicketType.pegawaiReporting) return (data as ReportResponseModel).opdName;
    if (type == TicketType.pegawaiRequest) return (data as ServiceRequestResponseModel).opdName;
    return "-";
  }

  String _getServiceTypeLabel(TicketType type) {
    switch (type) {
      case TicketType.masyarakatReporting:
      case TicketType.pegawaiReporting:
        return "Pelaporan Online";
      case TicketType.pegawaiRequest:
        return "Pengajuan Pelayanan";
    }
  }

  Future<pw.MemoryImage?> _loadAssetImage(String path) async {
    try {
      final data = await rootBundle.load(path);
      return pw.MemoryImage(data.buffer.asUint8List());
    } catch (e) {
      return null; // Return null jika gagal load (fallback ke text/icon default)
    }
  }

  Future<String> _savePdfFile(pw.Document pdf, String ticketCode) async {
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/Tiket_$ticketCode.pdf");
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }
}