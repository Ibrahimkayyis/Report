import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';
import 'package:report/src/modules/notification/domain/usecase/delete_notification_usecase.dart';
import 'package:report/src/modules/notification/domain/usecase/get_notifications_usecase.dart';
import 'package:report/src/modules/notification/domain/usecase/mark_all_notifications_read_usecase.dart';
import 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkAllNotificationsReadUseCase _markAllNotificationsReadUseCase;
  final DeleteNotificationUseCase _deleteNotificationUseCase;

  NotificationCubit(
    this._getNotificationsUseCase,
    this._markAllNotificationsReadUseCase,
    this._deleteNotificationUseCase,
  ) : super(NotificationInitial());

  /// Mengambil daftar notifikasi dari API
  Future<void> fetchNotifications() async {
    emit(NotificationLoading());

    try {
      final result = await _getNotificationsUseCase();

      if (result.isEmpty) {
        emit(NotificationEmpty());
      } else {
        emit(NotificationLoaded(result));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  /// Menandai semua notifikasi sudah dibaca
  Future<void> markAllRead() async {
    if (state is! NotificationLoaded) return;

    final currentList = (state as NotificationLoaded).notifications;

    try {
      // 1. Panggil API
      await _markAllNotificationsReadUseCase();

      // 2. Update State Lokal secara Optimistic (Tanpa fetch ulang biar cepat)
      // Buat list baru di mana semua isRead = true
      final updatedList = currentList.map((notif) {
        return NotificationModel(
          id: notif.id,
          ticketId: notif.ticketId,
          ticketCode: notif.ticketCode,
          requestType: notif.requestType,
          opdId: notif.opdId,
          opdName: notif.opdName,
          rejectionReason: notif.rejectionReason,
          statusTicket: notif.statusTicket,
          message: notif.message,
          isRead: true, // ✅ Force True
          createdAt: notif.createdAt,
        );
      }).toList();

      emit(NotificationLoaded(updatedList));
      
    } catch (e) {
      // Jika gagal, biarkan state tetap di list lama (Loaded)
      // Opsional: Emit error khusus jika ingin menampilkan snackbar
      // Tapi untuk sekarang kita log saja atau biarkan user coba lagi
    }
  }

  /// [NEW] Menghapus beberapa notifikasi sekaligus
  Future<void> deleteNotifications(List<String> ids) async {
    // Kita tidak emit loading agar UI tidak flicker, tapi bisa ditangani di UI (Dialog Loading)
    try {
      // Panggil API delete untuk setiap ID secara paralel agar cepat
      await Future.wait(ids.map((id) => _deleteNotificationUseCase(id)));

      // Setelah sukses hapus di server, fetch ulang list terbaru
      await fetchNotifications();
    } catch (e) {
      emit(NotificationError("Gagal menghapus beberapa notifikasi: $e"));
      // Fetch ulang untuk memastikan konsistensi data
      fetchNotifications();
    }
  }
}