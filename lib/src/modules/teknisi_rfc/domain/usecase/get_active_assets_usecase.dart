import 'package:injectable/injectable.dart';
import '../models/configuration_item_model.dart';
import '../repositories/rfc_repository.dart';

@lazySingleton
class GetActiveAssetsUseCase {
  final RfcRepository repository;

  GetActiveAssetsUseCase(this.repository);

  Future<List<ConfigurationItemModel>> call() {
    return repository.getActiveAssets();
  }
}