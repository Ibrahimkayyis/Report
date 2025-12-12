import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/asset_repository.dart';

@lazySingleton
class GetAssetsUseCase {
  final AssetRepository repository;

  GetAssetsUseCase(this.repository);

  Future<List<AssetModel>> call({
    int page = 1, 
    String? search, 
    String? statusFilter,
  }) {
    return repository.getAssets(
      page: page, 
      search: search, 
      statusFilter: statusFilter,
    );
  }
}