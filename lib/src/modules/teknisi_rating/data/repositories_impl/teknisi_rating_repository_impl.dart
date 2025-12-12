import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rating/data/datasources/remote/source/abstract/teknisi_rating_remote_data_source.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';
import 'package:report/src/modules/teknisi_rating/domain/repositories/teknisi_rating_repository.dart';

@LazySingleton(as: TeknisiRatingRepository)
class TeknisiRatingRepositoryImpl implements TeknisiRatingRepository {
  final TeknisiRatingRemoteDataSource remoteDataSource;

  TeknisiRatingRepositoryImpl(this.remoteDataSource);

  @override
  Future<TeknisiRatingResponse> getRatings() async {
    try {
      return await remoteDataSource.getRatings();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TeknisiRatingModel> getRatingDetail(String ticketId) async {
    try {
      return await remoteDataSource.getRatingDetail(ticketId);
    } catch (e) {
      rethrow;
    }
  }
}