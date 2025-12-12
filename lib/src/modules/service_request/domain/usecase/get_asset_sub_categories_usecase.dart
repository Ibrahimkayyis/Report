import 'package:injectable/injectable.dart';
import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/repositories/service_request_repository.dart';

@lazySingleton
class GetAssetSubCategoriesUseCase {
  final ServiceRequestRepository repository;

  GetAssetSubCategoriesUseCase(this.repository);

  Future<List<AssetSubCategoryModel>> call() {
    return repository.getSubCategories();
  }
}