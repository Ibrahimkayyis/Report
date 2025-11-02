import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/opd_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/opd_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/opd_repository.dart';

@LazySingleton(as: OpdRepository)
class OpdRepositoryImpl implements OpdRepository {
  final OpdRemoteDataSource remoteDataSource;

  OpdRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<OpdModel>> getAllOpd() async {
    try {
      return await remoteDataSource.getAllOpd();
    } catch (e) {
      throw Exception('Gagal memuat daftar OPD: $e');
    }
  }
}