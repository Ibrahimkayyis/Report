import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';
import 'package:report/src/modules/teknisi_rating/domain/repositories/teknisi_rating_repository.dart';

@lazySingleton
class GetTeknisiRatingDetailUseCase {
  final TeknisiRatingRepository repository;

  GetTeknisiRatingDetailUseCase(this.repository);

  Future<TeknisiRatingModel> call(String ticketId) {
    return repository.getRatingDetail(ticketId);
  }
}