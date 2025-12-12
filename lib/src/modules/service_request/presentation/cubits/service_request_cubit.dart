import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/service_request/domain/usecase/create_service_request_usecase.dart';
import 'package:report/src/modules/service_request/domain/usecase/get_asset_sub_categories_usecase.dart';
import 'service_request_state.dart';

@injectable
class ServiceRequestCubit extends Cubit<ServiceRequestState> {
  final GetAssetSubCategoriesUseCase _getSubCategoriesUseCase;
  final CreateServiceRequestUseCase _createServiceRequestUseCase;

  ServiceRequestCubit(
    this._getSubCategoriesUseCase,
    this._createServiceRequestUseCase,
  ) : super(const ServiceRequestState());

  /// 1. Mengambil data Sub Categories untuk dropdown
  Future<void> fetchSubCategories() async {
    // Kita hanya loading jika status belum sukses
    if (state.status == ServiceRequestStatus.success) return;
    
    emit(state.copyWith(status: ServiceRequestStatus.loading));

    try {
      final result = await _getSubCategoriesUseCase();
      
      emit(state.copyWith(
        status: ServiceRequestStatus.success,
        subCategories: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ServiceRequestStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  /// 2. Mengirim form Pengajuan Pelayanan
  Future<void> submitRequest({
    required int subCategoryId,
    required String title,
    String? location,
    required String description,
    String? expectedResolution,
    List<File>? files,
  }) async {
    emit(state.copyWith(submissionStatus: SubmissionStatus.submitting));

    try {
      final result = await _createServiceRequestUseCase(
        subCategoryId: subCategoryId,
        title: title,
        location: location,
        description: description,
        expectedResolution: expectedResolution,
        files: files,
      );

      emit(state.copyWith(
        submissionStatus: SubmissionStatus.success,
        submitResult: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        submissionStatus: SubmissionStatus.error,
        submissionError: e.toString(),
      ));
    }
  }
}