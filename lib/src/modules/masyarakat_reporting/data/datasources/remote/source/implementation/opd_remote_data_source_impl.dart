import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/mapper/opd_mapper.dart';
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/abstract/opd_remote_data_source.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/opd_model.dart';

@LazySingleton(as: OpdRemoteDataSource)
class OpdRemoteDataSourceImpl implements OpdRemoteDataSource {
  final Dio dio;

  OpdRemoteDataSourceImpl(this.dio);

  @override
  Future<List<OpdModel>> getAllOpd() async {
    final response = await dio.get('/opd/dinas');

    if (response.statusCode == 200) {
      final data = response.data;

      // Ambil list di field "data"
      if (data is Map<String, dynamic> && data['data'] is List) {
        return OpdMapper.fromJsonList(data['data']);
      }
    }

    throw Exception('Gagal mengambil data OPD');
  }
}
