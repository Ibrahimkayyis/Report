import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';
import 'package:report/src/modules/knowledge_base/data/datasources/remote/mapper/tag_mapper.dart';

class ArticleMapper {
  static ArticleModel fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['article_id'] as String,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      coverPath: json['cover_path'] ?? '',
      authorName: _parseAuthorName(json['author']),
      authorEmail: json['author'] != null && json['author']['email'] != null
          ? json['author']['email'] as String
          : '',
      tags: (json['tags'] != null)
          ? TagMapper.fromJsonList(json['tags'] as List)
          : <TagModel>[],
    );
  }

  static List<ArticleModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  static String _parseAuthorName(dynamic authorJson) {
    if (authorJson == null) return 'Unknown';
    final first = authorJson['first_name'] ?? '';
    final last = authorJson['last_name'] ?? '';
    return '$first $last'.trim().isEmpty ? 'Unknown' : '$first $last';
  }
}
