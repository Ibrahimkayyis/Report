import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';
import 'package:report/src/modules/reporting/domain/repositories/ticket_category_repository.dart';

@lazySingleton
class GetTicketCategoriesUseCase {
  final TicketCategoryRepository _repository;

  GetTicketCategoriesUseCase(this._repository);

  Future<List<TicketCategoryModel>> call() async {
    return await _repository.getTicketCategories();
  }
}
