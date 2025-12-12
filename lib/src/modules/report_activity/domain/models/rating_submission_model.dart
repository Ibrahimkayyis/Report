import 'package:equatable/equatable.dart';

class RatingSubmissionModel extends Equatable {
  final String status;
  final String message;
  final String ratingId;
  final String ticketId;
  final int rating;
  final String? comment;
  final String createdAt;

  const RatingSubmissionModel({
    required this.status,
    required this.message,
    required this.ratingId,
    required this.ticketId,
    required this.rating,
    this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        ratingId,
        ticketId,
        rating,
        comment,
        createdAt,
      ];
}