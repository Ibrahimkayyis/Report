import 'dart:io';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

abstract class ReportRemoteDataSource {
  Future<ReportResponseModel> createPublicReport({
    required String opdId,
    required String categoryId,
    required String description,
    String? action,
    File? file,
  });
}
