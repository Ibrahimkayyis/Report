import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';

abstract class TeknisiRatingRepository {
  /// Mengambil daftar semua rating
  /// Endpoint: GET /api/teknisi/ratings
  Future<TeknisiRatingResponse> getRatings();

  /// Mengambil detail rating spesifik berdasarkan Ticket ID
  /// Endpoint: GET /api/teknisi/ratings/{ticket_id}
  Future<TeknisiRatingModel> getRatingDetail(String ticketId);
}