part of 'rfc_cubit.dart';

abstract class RfcState extends Equatable {
  const RfcState();

  @override
  List<Object?> get props => [];
}

class RfcInitial extends RfcState {}

class RfcLoading extends RfcState {}

class RfcLoaded extends RfcState {
  final List<RfcModel> submittedRfcs; // Gabungan Incident Repeat & Change Request

  const RfcLoaded({required this.submittedRfcs});

  @override
  List<Object?> get props => [submittedRfcs];
}

class RfcError extends RfcState {
  final String message;

  const RfcError(this.message);

  @override
  List<Object?> get props => [message];
}