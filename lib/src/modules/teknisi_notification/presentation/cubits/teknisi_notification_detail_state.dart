import 'package:equatable/equatable.dart';
import '../../domain/models/teknisi_notification_detail_model.dart';

abstract class TeknisiNotificationDetailState extends Equatable {
  const TeknisiNotificationDetailState();

  @override
  List<Object?> get props => [];
}

class TeknisiNotificationDetailInitial extends TeknisiNotificationDetailState {}

class TeknisiNotificationDetailLoading extends TeknisiNotificationDetailState {}

class TeknisiNotificationDetailLoaded extends TeknisiNotificationDetailState {
  final TeknisiNotificationDetailModel detail;

  const TeknisiNotificationDetailLoaded(this.detail);

  @override
  List<Object?> get props => [detail];
}

class TeknisiNotificationDetailError extends TeknisiNotificationDetailState {
  final String message;

  const TeknisiNotificationDetailError(this.message);

  @override
  List<Object?> get props => [message];
}