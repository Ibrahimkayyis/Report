import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/usecase/get_notification_detail_usecase.dart';
import 'package:report/src/modules/notification/domain/usecase/mark_notification_read_usecase.dart';
import 'notification_detail_state.dart';

@injectable
class NotificationDetailCubit extends Cubit<NotificationDetailState> {
  final GetNotificationDetailUseCase _getDetailUseCase;
  final MarkNotificationReadUseCase _markReadUseCase;

  NotificationDetailCubit(
    this._getDetailUseCase,
    this._markReadUseCase,
  ) : super(NotificationDetailInitial());

  Future<void> fetchDetail(String id) async {
    emit(NotificationDetailLoading());

    try {
      // 1. Ambil Data Detail
      final result = await _getDetailUseCase(id);

      // 2. Emit Loaded dulu agar user segera melihat konten
      emit(NotificationDetailLoaded(result));

      // 3. Tandai sebagai sudah dibaca (Fire and forget / Background)
      // Kita tidak perlu menunggu ini selesai untuk menampilkan UI
      if (!result.isRead) {
        try {
          await _markReadUseCase(id);
        } catch (_) {
          // Silent error: Jika gagal mark read, biarkan saja, jangan ganggu UI detail
        }
      }
    } catch (e) {
      emit(NotificationDetailError(e.toString()));
    }
  }
}