import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';

class TicketCategoryMapper {
  static TicketCategoryModel fromJson(Map<String, dynamic> json) {
    return TicketCategoryModel(
      categoryId: json['category_id'] ?? '',
      opdId: json['opd_id'] ?? '',
      categoryName: json['category_name'] ?? '',
      description: json['description'],
    );
  }

  static List<TicketCategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
