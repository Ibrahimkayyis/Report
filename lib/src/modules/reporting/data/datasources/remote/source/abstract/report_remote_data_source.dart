import 'dart:io';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

abstract class ReportRemoteDataSource {
  /// Mengirim laporan baru (Pegawai)
  Future<ReportResponseModel> createReport({
    required int assetId,
    required String title,
    required String description,
    required String location,
    required String expectedResolution,
    required List<File> files,
  });
}