import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/report_repository.dart';

@injectable
class CreatePublicReportUsecase {
  final ReportRepository repository;

  CreatePublicReportUsecase(this.repository);

  Future<ReportResponseModel> call({
    required String opdId,
    required String categoryId,
    required String description,
    String? action,
    File? file,
  }) {
    return repository.createPublicReport(
      opdId: opdId,
      categoryId: categoryId,
      description: description,
      action: action,
      file: file,
    );
  }
}
