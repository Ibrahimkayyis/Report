import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecase/delete_teknisi_notification_usecase.dart';
import '../../domain/usecase/get_teknisi_notifications_usecase.dart';
import '../../domain/usecase/mark_all_teknisi_notifications_read_usecase.dart';
import '../../domain/usecase/mark_teknisi_notification_read_usecase.dart';
import 'teknisi_notification_state.dart';

@injectable
class TeknisiNotificationCubit extends Cubit<TeknisiNotificationState> {
  final GetTeknisiNotificationsUseCase getNotifications;
  final DeleteTeknisiNotificationUseCase deleteNotificationUseCase;
  final MarkAllTeknisiNotificationsReadUseCase markAllReadUseCase;
  final MarkTeknisiNotificationReadUseCase markReadUseCase;

  TeknisiNotificationCubit({
    required this.getNotifications,
    required this.deleteNotificationUseCase,
    required this.markAllReadUseCase,
    required this.markReadUseCase,
  }) : super(TeknisiNotificationInitial());

  /// Mengambil daftar notifikasi dari API
  Future<void> fetchNotifications() async {
    emit(TeknisiNotificationLoading());
    try {
      final result = await getNotifications();

      if (result.notifications.isEmpty) {
        emit(TeknisiNotificationEmpty());
      } else {
        emit(TeknisiNotificationLoaded(
          notifications: result.notifications,
          totalCount: result.totalNotifications,
          unreadCount: result.unreadNotifications,
        ));
      }
    } catch (e) {
      emit(TeknisiNotificationError(e.toString()));
    }
  }

  /// Menghapus notifikasi berdasarkan ID (bisa single atau loop untuk multiple)
  /// Disini kita handle list ID agar sesuai dengan fitur "Selection Mode" di UI
  Future<void> deleteNotifications(List<String> ids) async {
    // Kita tetap emit loading, tapi idealnya UI menampilkan overlay loading
    // agar list tidak hilang tiba-tiba
    emit(TeknisiNotificationLoading()); 
    try {
      // Loop delete untuk setiap ID (karena API endpoint per ID)
      // Jika backend support bulk delete, lebih baik pakai endpoint bulk.
      for (final id in ids) {
        await deleteNotificationUseCase(id);
      }
      
      // Fetch ulang agar data sinkron dengan server
      await fetchNotifications();
    } catch (e) {
      emit(TeknisiNotificationError("Gagal menghapus notifikasi: $e"));
      // Kembalikan data lama jika memungkinkan (opsional handling)
    }
  }

  /// Menandai semua notifikasi sudah dibaca
  Future<void> markAllRead() async {
    try {
      await markAllReadUseCase();
      
      // Optimistic Update: Langsung update state lokal biar cepat
      if (state is TeknisiNotificationLoaded) {
        final currentState = state as TeknisiNotificationLoaded;
        final updatedList = currentState.notifications.map((e) {
          // Buat model baru dengan isRead = true (karena model immutable)
          // Asumsi TeknisiNotificationModel punya copyWith, atau kita fetch ulang
          return e; // Idealnya: e.copyWith(isRead: true);
        }).toList();

        // Karena Model belum ada copyWith di langkah 1, kita fetch ulang saja agar aman
        await fetchNotifications();
      } else {
        await fetchNotifications();
      }
    } catch (e) {
      emit(TeknisiNotificationError("Gagal menandai dibaca: $e"));
    }
  }
  
  /// Menandai satu notifikasi dibaca (dipakai saat klik item)
  Future<void> markAsRead(String id) async {
    try {
      await markReadUseCase(id);
      // Tidak perlu emit loading, cukup fetch ulang diam-diam atau biarkan saja
      // sampai user refresh, atau fetchNotifications() dipanggil kembali.
    } catch (_) {
      // Silent error
    }
  }
}