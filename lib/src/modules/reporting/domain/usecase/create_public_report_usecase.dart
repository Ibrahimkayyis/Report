import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/report_repository.dart';

@lazySingleton
class CreatePublicReportUseCase {
  final ReportRepository repository;

  CreatePublicReportUseCase(this.repository);

  Future<ReportResponseModel> call({
    required int assetId,
    required String title,
    required String description,
    required String location,
    required String expectedResolution,
    required List<File> files,
  }) {
    return repository.createReport(
      assetId: assetId,
      title: title,
      description: description,
      location: location,
      expectedResolution: expectedResolution,
      files: files,
    );
  }
}