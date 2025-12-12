import 'dart:io';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';

abstract class MasyarakatReportRepository {
  /// Membuat laporan pengaduan baru (Masyarakat)
  /// Endpoint: POST /api/pelaporan-online-masyarakat
  Future<MasyarakatReportResponseModel> createPublicReport({
    required String title,
    required int idOpd, // Sesuai API: Integer
    required String description,
    List<File>? files,
  });
}