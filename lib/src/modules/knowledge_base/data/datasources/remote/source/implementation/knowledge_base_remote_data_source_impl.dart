import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/knowledge_base/data/datasources/remote/mapper/article_mapper.dart';
import 'package:report/src/modules/knowledge_base/data/datasources/remote/mapper/tag_mapper.dart';
import 'package:report/src/modules/knowledge_base/data/datasources/remote/source/abstract/knowledge_base_remote_data_source.dart';
import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/domain/models/tag_model.dart';

@LazySingleton(as: KnowledgeBaseRemoteDataSource)
class KnowledgeBaseRemoteDataSourceImpl implements KnowledgeBaseRemoteDataSource {
  final Dio dio;

  KnowledgeBaseRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> getAllArticles() async {
    final response = await dio.get('/articles/');

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return ArticleMapper.fromJsonList(data);
      }
    }

    throw Exception('Gagal mengambil daftar artikel');
  }

  @override
  Future<List<TagModel>> getAllTags() async {
    final response = await dio.get('/articles/tags');

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return TagMapper.fromJsonList(data);
      }
    }

    throw Exception('Gagal mengambil daftar tag');
  }
}
