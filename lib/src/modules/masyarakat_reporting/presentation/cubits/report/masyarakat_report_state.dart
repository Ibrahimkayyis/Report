import 'package:equatable/equatable.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';

abstract class MasyarakatReportState extends Equatable {
  const MasyarakatReportState();

  @override
  List<Object?> get props => [];
}

class MasyarakatReportInitial extends MasyarakatReportState {}

class MasyarakatReportLoading extends MasyarakatReportState {}

class MasyarakatReportSuccess extends MasyarakatReportState {
  final MasyarakatReportResponseModel response;

  const MasyarakatReportSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class MasyarakatReportError extends MasyarakatReportState {
  final String message;

  const MasyarakatReportError(this.message);

  @override
  List<Object?> get props => [message];
}