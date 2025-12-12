import 'package:report/src/modules/masyarakat_reporting/domain/models/opd_model.dart';

class OpdMapper {
  static OpdModel fromJson(Map<String, dynamic> json) {
    return OpdModel(
      opdId: json['id']?.toString() ?? '',
      opdName: json['nama'] as String? ?? '',
      description: json['description'] as String? ?? '',
      filePath: json['file_path'] as String?,
    );
  }

  static List<OpdModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .whereType<Map<String, dynamic>>()
        .map(OpdMapper.fromJson)
        .toList();
  }
}
