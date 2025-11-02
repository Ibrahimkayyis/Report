import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/report_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/report_repository.dart';

@LazySingleton(as: ReportRepository)
class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource _remoteDataSource;

  ReportRepositoryImpl(this._remoteDataSource);

  @override
  Future<ReportResponseModel> createPublicReport({
    required String opdId,
    required String categoryId,
    required String description,
    String? action,
    File? file,
  }) {
    return _remoteDataSource.createPublicReport(
      opdId: opdId,
      categoryId: categoryId,
      description: description,
      action: action,
      file: file,
    );
  }
}
