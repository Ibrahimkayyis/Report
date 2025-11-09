import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/knowledge_base/domain/usecase/get_all_articles_usecase.dart';
import 'package:report/src/modules/knowledge_base/domain/usecase/get_all_tags_usecase.dart';
import 'knowledge_base_state.dart';

@injectable
class KnowledgeBaseCubit extends Cubit<KnowledgeBaseState> {
  final GetAllArticlesUseCase getAllArticlesUseCase;
  final GetAllTagsUseCase getAllTagsUseCase;

  KnowledgeBaseCubit(
    this.getAllArticlesUseCase,
    this.getAllTagsUseCase,
  ) : super(KnowledgeBaseInitial());

  /// 🔹 Fetch semua data Knowledge Base
  Future<void> fetchKnowledgeBaseData() async {
    emit(KnowledgeBaseLoading());
    try {
      final articles = await getAllArticlesUseCase();
      final tags = await getAllTagsUseCase();

      emit(KnowledgeBaseLoaded(articles: articles, tags: tags));
    } catch (e) {
      emit(KnowledgeBaseError(e.toString()));
    }
  }
}
