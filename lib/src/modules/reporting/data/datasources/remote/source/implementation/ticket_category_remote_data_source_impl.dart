import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/mapper/ticket_category_mapper.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/ticket_category_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';

@LazySingleton(as: TicketCategoryRemoteDataSource)
class TicketCategoryRemoteDataSourceImpl
    implements TicketCategoryRemoteDataSource {
  final Dio dio;

  TicketCategoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<TicketCategoryModel>> getTicketCategories() async {
    final response = await dio.get('/api/ticket-categories');

    if (response.statusCode == 200 && response.data is List) {
      final data = response.data as List;
      return data.map((json) => TicketCategoryMapper.fromJson(json)).toList();
    }

    throw Exception('Gagal memuat daftar kategori tiket');
  }
}
