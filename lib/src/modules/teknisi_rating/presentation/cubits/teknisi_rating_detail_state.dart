import 'package:equatable/equatable.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';

enum TeknisiRatingDetailStatus { initial, loading, success, failure }

class TeknisiRatingDetailState extends Equatable {
  final TeknisiRatingDetailStatus status;
  final TeknisiRatingModel? rating;
  final String? errorMessage;

  const TeknisiRatingDetailState({
    this.status = TeknisiRatingDetailStatus.initial,
    this.rating,
    this.errorMessage,
  });

  TeknisiRatingDetailState copyWith({
    TeknisiRatingDetailStatus? status,
    TeknisiRatingModel? rating,
    String? errorMessage,
  }) {
    return TeknisiRatingDetailState(
      status: status ?? this.status,
      rating: rating ?? this.rating,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, rating, errorMessage];
}