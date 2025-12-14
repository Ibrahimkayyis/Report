import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecase/get_teknisi_notification_detail_usecase.dart';
import 'teknisi_notification_detail_state.dart';

@injectable
class TeknisiNotificationDetailCubit extends Cubit<TeknisiNotificationDetailState> {
  final GetTeknisiNotificationDetailUseCase getDetailUseCase;

  TeknisiNotificationDetailCubit({
    required this.getDetailUseCase,
  }) : super(TeknisiNotificationDetailInitial());

  /// Mengambil detail notifikasi berdasarkan ID
  Future<void> fetchDetail(String id) async {
    emit(TeknisiNotificationDetailLoading());
    try {
      final result = await getDetailUseCase(id);
      emit(TeknisiNotificationDetailLoaded(result));
    } catch (e) {
      emit(TeknisiNotificationDetailError(e.toString()));
    }
  }
}