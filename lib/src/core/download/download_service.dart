import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

/// Enum untuk menentukan template PDF yang akan digunakan
enum TicketType {
  masyarakatReporting, // Laporan Masyarakat
  pegawaiReporting,    // Laporan Aset Pegawai
  pegawaiRequest,      // Pengajuan Layanan Pegawai
}

/// Abstract Class / Interface untuk Download Service
abstract class DownloadService {
  /// Generate PDF Tiket dan mengembalikan path file lokal.
  /// [data] bisa berupa [MasyarakatReportResponseModel], [ReportResponseModel], 
  /// atau [ServiceRequestResponseModel] tergantung [type].
  Future<String> generatePdfTicket({
    required dynamic data,
    required TicketType type,
  });
}