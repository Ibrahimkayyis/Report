import 'package:equatable/equatable.dart';
import 'package:report/src/modules/notification/domain/models/notification_detail_model.dart';

abstract class NotificationDetailState extends Equatable {
  const NotificationDetailState();

  @override
  List<Object?> get props => [];
}

class NotificationDetailInitial extends NotificationDetailState {}

class NotificationDetailLoading extends NotificationDetailState {}

class NotificationDetailLoaded extends NotificationDetailState {
  final NotificationDetailModel detail;

  const NotificationDetailLoaded(this.detail);

  @override
  List<Object?> get props => [detail];
}

class NotificationDetailError extends NotificationDetailState {
  final String message;

  const NotificationDetailError(this.message);

  @override
  List<Object?> get props => [message];
}