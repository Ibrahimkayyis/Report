import 'package:injectable/injectable.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart';
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart';

@lazySingleton
class SubmitTicketRatingUseCase {
  final ReportActivityRepository repository;

  SubmitTicketRatingUseCase(this.repository);

  Future<RatingSubmissionModel> call({
    required String ticketId,
    required int rating,
    String? comment,
  }) {
    return repository.submitTicketRating(
      ticketId: ticketId,
      rating: rating,
      comment: comment,
    );
  }
}