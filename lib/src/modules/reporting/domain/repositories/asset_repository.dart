import 'package:report/src/modules/reporting/domain/models/asset_model.dart';

abstract class AssetRepository {
  Future<List<AssetModel>> getAssets({
    int page = 1, 
    String? search, 
    String? statusFilter,
  });
}