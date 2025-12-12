import 'package:equatable/equatable.dart';
import 'package:report/src/modules/report_activity/domain/models/rating_submission_model.dart';

abstract class TicketRatingState extends Equatable {
  const TicketRatingState();

  @override
  List<Object?> get props => [];
}

class TicketRatingInitial extends TicketRatingState {}

class TicketRatingLoading extends TicketRatingState {}

class TicketRatingSuccess extends TicketRatingState {
  final RatingSubmissionModel response;

  const TicketRatingSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class TicketRatingError extends TicketRatingState {
  final String message;

  const TicketRatingError(this.message);

  @override
  List<Object?> get props => [message];
}