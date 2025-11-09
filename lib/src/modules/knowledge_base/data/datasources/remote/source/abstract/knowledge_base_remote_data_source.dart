import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';

abstract class KnowledgeBaseRemoteDataSource {
  Future<List<ArticleModel>> getAllArticles();
  Future<List<TagModel>> getAllTags();
}
