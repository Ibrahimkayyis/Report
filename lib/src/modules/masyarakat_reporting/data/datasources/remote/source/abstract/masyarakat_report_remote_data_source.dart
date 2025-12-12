import 'dart:io';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';

abstract class MasyarakatReportRemoteDataSource {
  Future<MasyarakatReportResponseModel> createPublicReport({
    required String title,
    required int idOpd,
    required String description,
    List<File>? files,
  });
}