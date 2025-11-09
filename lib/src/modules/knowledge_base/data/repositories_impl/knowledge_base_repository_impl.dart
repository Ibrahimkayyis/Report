import 'package:injectable/injectable.dart';
import 'package:report/src/modules/knowledge_base/data/datasources/remote/source/abstract/knowledge_base_remote_data_source.dart';
import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';
import 'package:report/src/modules/knowledge_base/domain/repositories/knowledge_base_repository.dart';

@LazySingleton(as: KnowledgeBaseRepository)
class KnowledgeBaseRepositoryImpl implements KnowledgeBaseRepository {
  final KnowledgeBaseRemoteDataSource remoteDataSource;

  KnowledgeBaseRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ArticleModel>> getAllArticles() async {
    return await remoteDataSource.getAllArticles();
  }

  @override
  Future<List<TagModel>> getAllTags() async {
    return await remoteDataSource.getAllTags();
  }
}
