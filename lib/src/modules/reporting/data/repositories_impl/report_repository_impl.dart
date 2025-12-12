import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/report_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/report_repository.dart';

@LazySingleton(as: ReportRepository)
class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource remoteDataSource;

  ReportRepositoryImpl(this.remoteDataSource);

  @override
  Future<ReportResponseModel> createReport({
    required int assetId,
    required String title,
    required String description,
    required String location,
    required String expectedResolution,
    required List<File> files,
  }) async {
    try {
      return await remoteDataSource.createReport(
        assetId: assetId,
        title: title,
        description: description,
        location: location,
        expectedResolution: expectedResolution,
        files: files,
      );
    } catch (e) {
      rethrow;
    }
  }
}