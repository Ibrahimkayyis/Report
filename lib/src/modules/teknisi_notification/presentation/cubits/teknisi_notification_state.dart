import 'package:equatable/equatable.dart';
import '../../domain/models/teknisi_notification_model.dart';

abstract class TeknisiNotificationState extends Equatable {
  const TeknisiNotificationState();

  @override
  List<Object?> get props => [];
}

class TeknisiNotificationInitial extends TeknisiNotificationState {}

class TeknisiNotificationLoading extends TeknisiNotificationState {}

class TeknisiNotificationLoaded extends TeknisiNotificationState {
  final List<TeknisiNotificationModel> notifications;
  final int totalCount;
  final int unreadCount;

  const TeknisiNotificationLoaded({
    required this.notifications,
    required this.totalCount,
    required this.unreadCount,
  });

  @override
  List<Object?> get props => [notifications, totalCount, unreadCount];
  
  // Helper untuk mempermudah update state parsial (misal update list tanpa ubah count)
  TeknisiNotificationLoaded copyWith({
    List<TeknisiNotificationModel>? notifications,
    int? totalCount,
    int? unreadCount,
  }) {
    return TeknisiNotificationLoaded(
      notifications: notifications ?? this.notifications,
      totalCount: totalCount ?? this.totalCount,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}

class TeknisiNotificationEmpty extends TeknisiNotificationState {}

class TeknisiNotificationError extends TeknisiNotificationState {
  final String message;

  const TeknisiNotificationError(this.message);

  @override
  List<Object?> get props => [message];
}