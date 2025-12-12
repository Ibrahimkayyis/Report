import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/abstract/masyarakat_report_remote_data_source.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/repositories/masyarakat_report_repository.dart';

@LazySingleton(as: MasyarakatReportRepository)
class MasyarakatReportRepositoryImpl implements MasyarakatReportRepository {
  final MasyarakatReportRemoteDataSource remoteDataSource;

  MasyarakatReportRepositoryImpl(this.remoteDataSource);

  @override
  Future<MasyarakatReportResponseModel> createPublicReport({
    required String title,
    required int idOpd,
    required String description,
    List<File>? files,
  }) async {
    try {
      return await remoteDataSource.createPublicReport(
        title: title,
        idOpd: idOpd,
        description: description,
        files: files,
      );
    } catch (e) {
      rethrow;
    }
  }
}