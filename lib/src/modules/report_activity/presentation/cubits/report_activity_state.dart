import 'package:equatable/equatable.dart';
import 'package:report/src/modules/report_activity/domain/models/activity_model.dart';

abstract class ReportActivityState extends Equatable {
  const ReportActivityState();

  @override
  List<Object?> get props => [];
}

class ReportActivityInitial extends ReportActivityState {}

class ReportActivityLoading extends ReportActivityState {}

class ReportActivityLoaded extends ReportActivityState {
  final List<ActivityModel> activities;

  const ReportActivityLoaded(this.activities);

  @override
  List<Object?> get props => [activities];
}

class ReportActivityEmpty extends ReportActivityState {}

class ReportActivityError extends ReportActivityState {
  final String message;

  const ReportActivityError(this.message);

  @override
  List<Object?> get props => [message];
}