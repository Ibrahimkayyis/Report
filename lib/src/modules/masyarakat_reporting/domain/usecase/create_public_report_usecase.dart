import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/repositories/masyarakat_report_repository.dart';

@lazySingleton
class CreatePublicReportUseCase {
  final MasyarakatReportRepository repository;

  CreatePublicReportUseCase(this.repository);

  Future<MasyarakatReportResponseModel> call({
    required String title,
    required int idOpd,
    required String description,
    List<File>? files,
  }) {
    return repository.createPublicReport(
      title: title,
      idOpd: idOpd,
      description: description,
      files: files,
    );
  }
}