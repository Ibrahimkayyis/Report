import 'package:equatable/equatable.dart';
import 'tag_model.dart';

class ArticleModel extends Equatable {
  final String id;
  final String title;
  final String content;
  final String? coverPath;
  final List<TagModel> tags;
  final String authorName;
  final String authorEmail;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    this.coverPath,
    required this.tags,
    required this.authorName,
    required this.authorEmail,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        coverPath,
        tags,
        authorName,
        authorEmail,
      ];
}
