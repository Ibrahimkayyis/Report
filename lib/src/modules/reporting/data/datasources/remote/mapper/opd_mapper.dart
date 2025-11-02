import 'package:report/src/modules/reporting/domain/models/opd_model.dart';

class OpdMapper {
  static OpdModel fromJson(Map<String, Object?> json) {
    return OpdModel(
      opdId: json['opd_id'] as String? ?? '',
      opdName: json['opd_name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }

  static List<OpdModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .whereType<Map<String, dynamic>>()
        .map(OpdMapper.fromJson)
        .toList();
  }
}
