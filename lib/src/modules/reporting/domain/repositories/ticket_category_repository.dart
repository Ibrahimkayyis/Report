import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';

abstract class TicketCategoryRepository {
  Future<List<TicketCategoryModel>> getTicketCategories();
}
