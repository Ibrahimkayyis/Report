import 'package:equatable/equatable.dart';

class TicketRatingModel extends Equatable {
  final int rating;
  final String? comment;
  final String? createdAt;

  const TicketRatingModel({
    required this.rating,
    this.comment,
    this.createdAt,
  });

  @override
  List<Object?> get props => [rating, comment, createdAt];
}