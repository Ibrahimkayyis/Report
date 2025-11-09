import 'package:injectable/injectable.dart';
import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';
import 'package:report/src/modules/knowledge_base/domain/repositories/knowledge_base_repository.dart';

@lazySingleton
class GetAllTagsUseCase {
  final KnowledgeBaseRepository repository;

  GetAllTagsUseCase(this.repository);

  Future<List<TagModel>> call() async {
    return await repository.getAllTags();
  }
}
