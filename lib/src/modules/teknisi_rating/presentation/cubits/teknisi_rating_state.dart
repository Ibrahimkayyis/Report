import 'package:equatable/equatable.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';

enum TeknisiRatingStatus { initial, loading, success, failure }

class TeknisiRatingState extends Equatable {
  final TeknisiRatingStatus status;
  final List<TeknisiRatingModel> allRatings;      // Data Master dari API
  final List<TeknisiRatingModel> filteredRatings; // Data Tampil di UI
  final String? errorMessage;

  // --- State Filter ---
  final int selectedTabIndex;
  final String? filterKategori;
  final String? filterBentuk;
  final String? filterJenis;
  final String? filterRating; // Contoh: "4 ⭐"

  const TeknisiRatingState({
    this.status = TeknisiRatingStatus.initial,
    this.allRatings = const [],
    this.filteredRatings = const [],
    this.errorMessage,
    this.selectedTabIndex = 0,
    this.filterKategori,
    this.filterBentuk,
    this.filterJenis,
    this.filterRating,
  });

  TeknisiRatingState copyWith({
    TeknisiRatingStatus? status,
    List<TeknisiRatingModel>? allRatings,
    List<TeknisiRatingModel>? filteredRatings,
    String? errorMessage,
    int? selectedTabIndex,
    String? filterKategori,
    String? filterBentuk,
    String? filterJenis,
    String? filterRating,
  }) {
    return TeknisiRatingState(
      status: status ?? this.status,
      allRatings: allRatings ?? this.allRatings,
      filteredRatings: filteredRatings ?? this.filteredRatings,
      errorMessage: errorMessage,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      filterKategori: filterKategori ?? this.filterKategori,
      filterBentuk: filterBentuk ?? this.filterBentuk,
      filterJenis: filterJenis ?? this.filterJenis,
      filterRating: filterRating ?? this.filterRating,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allRatings,
        filteredRatings,
        errorMessage,
        selectedTabIndex,
        filterKategori,
        filterBentuk,
        filterJenis,
        filterRating,
      ];
}