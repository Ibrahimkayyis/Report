import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/teknisi_rating/data/datasources/remote/mapper/teknisi_rating_mapper.dart';
import 'package:report/src/modules/teknisi_rating/data/datasources/remote/source/abstract/teknisi_rating_remote_data_source.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';

@LazySingleton(as: TeknisiRatingRemoteDataSource)
class TeknisiRatingRemoteDataSourceImpl implements TeknisiRatingRemoteDataSource {
  final Dio dio;

  TeknisiRatingRemoteDataSourceImpl(this.dio);

  @override
  Future<TeknisiRatingResponse> getRatings() async {
    try {
      const endpoint = '/api/teknisi/ratings';
      AppLogger.i("📡 Fetching Ratings: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final result = TeknisiRatingMapper.fromResponse(response.data);
        AppLogger.i("✅ Loaded ${result.total} ratings");
        return result;
      }

      throw Exception('Failed to load ratings: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch ratings", e);
      rethrow;
    }
  }

  @override
  Future<TeknisiRatingModel> getRatingDetail(String ticketId) async {
    try {
      final endpoint = '/api/teknisi/ratings/$ticketId';
      AppLogger.i("📡 Fetching Rating Detail: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        // Response detail langsung object, bukan list
        final result = TeknisiRatingMapper.fromJson(response.data);
        AppLogger.i("✅ Detail Loaded for ticket: ${result.ticketCode}");
        return result;
      }

      throw Exception('Failed to load rating detail: ${response.statusCode}');
    } catch (e) {
      AppLogger.e("Gagal fetch rating detail", e);
      rethrow;
    }
  }
}