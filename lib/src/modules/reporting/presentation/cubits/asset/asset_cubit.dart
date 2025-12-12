import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';
import 'package:report/src/modules/reporting/domain/usecase/get_assets_usecase.dart';
import 'asset_state.dart';

@injectable
class AssetCubit extends Cubit<AssetState> {
  final GetAssetsUseCase _getAssetsUseCase;

  AssetCubit(this._getAssetsUseCase) : super(AssetInitial());

  // ✅ Fetch Initial: Status Aktif
  Future<void> fetchAssets() async {
    emit(AssetLoading());
    try {
      final result = await _getAssetsUseCase(
        page: 1, 
        search: '', 
        statusFilter: 'aktif', // Hanya ambil aset aktif
      );
      emit(AssetLoaded(result));
    } catch (e) {
      emit(AssetError(e.toString()));
    }
  }

  // ✅ Search Assets: Tetap Status Aktif
  Future<List<AssetModel>> searchAssets(String query) async {
    try {
      // Jika query kosong, kembalikan data yang sudah di-load (cache)
      if (query.isEmpty && state is AssetLoaded) {
        return (state as AssetLoaded).assets;
      }
      
      // Cari data, tapi tetap filter yang 'aktif' saja
      return await _getAssetsUseCase(
        page: 1, 
        search: query, 
        statusFilter: 'aktif', 
      );
    } catch (e) {
      return [];
    }
  }
}