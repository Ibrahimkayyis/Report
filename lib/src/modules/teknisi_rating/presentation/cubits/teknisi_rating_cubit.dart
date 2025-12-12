import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';
import 'package:report/src/modules/teknisi_rating/domain/usecase/get_teknisi_ratings_usecase.dart';
import 'teknisi_rating_state.dart';

@injectable
class TeknisiRatingCubit extends Cubit<TeknisiRatingState> {
  final GetTeknisiRatingsUseCase _getRatingsUseCase;

  TeknisiRatingCubit(this._getRatingsUseCase) : super(const TeknisiRatingState());

  /// 1. Fetch Data dari API
  Future<void> fetchRatings() async {
    emit(state.copyWith(status: TeknisiRatingStatus.loading));

    try {
      final response = await _getRatingsUseCase();
      
      emit(state.copyWith(
        status: TeknisiRatingStatus.success,
        allRatings: response.data,
      ));
      
      _applyFilters(); // Filter awal (Tab 0)
    } catch (e) {
      emit(state.copyWith(
        status: TeknisiRatingStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  /// 2. Update Filter UI
  void updateFilter({
    int? tabIndex,
    String? kategori,
    String? bentuk,
    String? jenis,
    String? rating,
  }) {
    emit(state.copyWith(
      selectedTabIndex: tabIndex,
      filterKategori: kategori,
      filterBentuk: bentuk,
      filterJenis: jenis,
      filterRating: rating,
    ));

    _applyFilters();
  }

  /// 3. Logika Filter
  void _applyFilters() {
    List<TeknisiRatingModel> temp = List.from(state.allRatings);

    // A. Filter Tab (Berdasarkan requestType)
    if (state.selectedTabIndex == 0) {
      // Tab 0: Pelaporan Online
      temp = temp.where((t) => t.requestType == 'pelaporan_online').toList();
    } else {
      // Tab 1: Pelayanan
      temp = temp.where((t) => t.requestType == 'pengajuan_pelayanan').toList();
    }

    // B. Filter Kategori (Field: asset.kategori)
    // Value: 'ti', 'non-ti'
    if (state.filterKategori != null && state.filterKategori != 'Semua') {
      temp = temp.where((t) {
        final kat = t.asset?.kategori ?? '';
        return kat.toLowerCase() == state.filterKategori!.toLowerCase();
      }).toList();
    }

    // C. Filter Bentuk (Field: asset.subkategoriNama)
    // Value: 'Server', 'Laptop', dll. Gunakan contains agar pencarian lebih fleksibel
    if (state.filterBentuk != null && state.filterBentuk != 'Semua') {
      temp = temp.where((t) {
        final subKat = t.asset?.subkategoriNama ?? '';
        return subKat.toLowerCase().contains(state.filterBentuk!.toLowerCase());
      }).toList();
    }

    // D. Filter Jenis (Field: asset.jenisAsset)
    // Value: 'barang', 'jasa'
    if (state.filterJenis != null && state.filterJenis != 'Semua') {
      temp = temp.where((t) {
        final jenis = t.asset?.jenisAsset ?? '';
        return jenis.toLowerCase() == state.filterJenis!.toLowerCase();
      }).toList();
    }

    // E. Filter Rating (Field: rating)
    // Value: "4 ⭐" -> ambil angka 4
    if (state.filterRating != null && state.filterRating != 'Semua') {
      final ratingStr = state.filterRating!.split(' ')[0]; // Ambil angka depan
      final ratingVal = int.tryParse(ratingStr);
      if (ratingVal != null) {
        temp = temp.where((t) => t.rating == ratingVal).toList();
      }
    }

    emit(state.copyWith(filteredRatings: temp));
  }
}