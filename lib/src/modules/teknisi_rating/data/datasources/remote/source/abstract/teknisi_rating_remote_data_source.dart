import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';

abstract class TeknisiRatingRemoteDataSource {
  /// Mengambil semua daftar rating teknisi
  Future<TeknisiRatingResponse> getRatings();

  /// Mengambil detail rating berdasarkan ID tiket
  Future<TeknisiRatingModel> getRatingDetail(String ticketId);
}