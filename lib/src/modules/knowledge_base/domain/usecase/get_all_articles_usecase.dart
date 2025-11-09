import 'package:injectable/injectable.dart';
import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/domain/repositories/knowledge_base_repository.dart';

@lazySingleton
class GetAllArticlesUseCase {
  final KnowledgeBaseRepository repository;

  GetAllArticlesUseCase(this.repository);

  Future<List<ArticleModel>> call() async {
    return await repository.getAllArticles();
  }
}
