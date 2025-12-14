import 'package:equatable/equatable.dart';
import 'teknisi_notification_model.dart';

class TeknisiNotificationListModel extends Equatable {
  final int totalNotifications;
  final int unreadNotifications;
  final List<TeknisiNotificationModel> notifications;

  const TeknisiNotificationListModel({
    required this.totalNotifications,
    required this.unreadNotifications,
    required this.notifications,
  });

  @override
  List<Object?> get props => [
        totalNotifications,
        unreadNotifications,
        notifications,
      ];
}