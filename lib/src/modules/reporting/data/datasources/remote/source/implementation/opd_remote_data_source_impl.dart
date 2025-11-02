import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/mapper/opd_mapper.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/opd_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/opd_model.dart';

@LazySingleton(as: OpdRemoteDataSource)
class OpdRemoteDataSourceImpl implements OpdRemoteDataSource {
  final Dio dio;
  
  OpdRemoteDataSourceImpl(this.dio);

  @override
  Future<List<OpdModel>> getAllOpd() async {
    final response = await dio.get('/opd/');

    if (response.statusCode == 200) {
      final data = response.data;

      if (data is List) {
        return OpdMapper.fromJsonList(data);
      }
    }

    throw Exception('Gagal mengambil data OPD');
  }
}