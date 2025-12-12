import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/mapper/asset_mapper.dart';
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/asset_remote_data_source.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';

@LazySingleton(as: AssetRemoteDataSource)
class AssetRemoteDataSourceImpl implements AssetRemoteDataSource {
  final Dio dio;

  AssetRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AssetModel>> getAssets({
    int page = 1, 
    String? search, 
    String? statusFilter,
  }) async {
    try {
      final endpoint = '/api/asset-barang';
      
      final Map<String, dynamic> queryParams = {
        'page': page,
      };

      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
        AppLogger.i("🔍 Searching Assets: $search");
      }

      // ✅ Implementasi Filter Status
      if (statusFilter != null && statusFilter.isNotEmpty) {
        queryParams['status_filter'] = statusFilter;
      }

      final response = await dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        // ✅ FIX Parsing: Ambil 'data' sebagai List langsung
        final List<dynamic> listData = response.data['data'];
        
        return listData
            .map((json) => AssetMapper.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      throw Exception('Failed to load assets: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch assets", e);
      rethrow;
    }
  }
}