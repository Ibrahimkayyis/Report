import 'package:equatable/equatable.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;

  const NotificationLoaded(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationEmpty extends NotificationState {}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}

// State khusus untuk aksi Mark All Read (agar bisa dilisten UI untuk SnackBar)
// Kita tidak ubah state utama agar list tidak hilang, tapi kita bisa gunakan
// pendekatan "Hybrid" atau cukup re-emit Loaded dengan data baru.
// Untuk kesederhanaan, kita handle error mark-all di UI via catch atau 
// biarkan Cubit me-refresh list secara silent.