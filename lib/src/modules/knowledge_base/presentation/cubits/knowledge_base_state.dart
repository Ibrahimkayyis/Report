import 'package:equatable/equatable.dart';
import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';

abstract class KnowledgeBaseState extends Equatable {
  const KnowledgeBaseState();

  @override
  List<Object?> get props => [];
}

/// Awal (belum load data)
class KnowledgeBaseInitial extends KnowledgeBaseState {}

/// Loading saat fetch data
class KnowledgeBaseLoading extends KnowledgeBaseState {}

/// Sukses ambil data
class KnowledgeBaseLoaded extends KnowledgeBaseState {
  final List<ArticleModel> articles;
  final List<TagModel> tags;

  const KnowledgeBaseLoaded({
    required this.articles,
    required this.tags,
  });

  @override
  List<Object?> get props => [articles, tags];
}

/// Error
class KnowledgeBaseError extends KnowledgeBaseState {
  final String message;

  const KnowledgeBaseError(this.message);

  @override
  List<Object?> get props => [message];
}
