import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';

class TagMapper {
  static TagModel fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['tag_id'] as String,
      name: json['tag_name'] as String,
    );
  }

  static List<TagModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}
