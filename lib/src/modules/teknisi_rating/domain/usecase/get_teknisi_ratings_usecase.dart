import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';
import 'package:report/src/modules/teknisi_rating/domain/repositories/teknisi_rating_repository.dart';

@lazySingleton
class GetTeknisiRatingsUseCase {
  final TeknisiRatingRepository repository;

  GetTeknisiRatingsUseCase(this.repository);

  Future<TeknisiRatingResponse> call() {
    return repository.getRatings();
  }
}