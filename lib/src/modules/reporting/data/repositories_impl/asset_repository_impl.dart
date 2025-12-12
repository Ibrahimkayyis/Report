import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/asset_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/asset_repository.dart';

@LazySingleton(as: AssetRepository)
class AssetRepositoryImpl implements AssetRepository {
  final AssetRemoteDataSource remoteDataSource;

  AssetRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<AssetModel>> getAssets({
    int page = 1, 
    String? search, 
    String? statusFilter,
  }) async {
    try {
      return await remoteDataSource.getAssets(
        page: page, 
        search: search, 
        statusFilter: statusFilter,
      );
    } catch (e) {
      rethrow;
    }
  }
}