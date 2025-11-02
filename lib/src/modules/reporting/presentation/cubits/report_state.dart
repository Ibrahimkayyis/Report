import 'package:equatable/equatable.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object?> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportSuccess extends ReportState {
  final ReportResponseModel report;

  const ReportSuccess(this.report);

  @override
  List<Object?> get props => [report];
}

class ReportError extends ReportState {
  final String message;

  const ReportError(this.message);

  @override
  List<Object?> get props => [message];
}
