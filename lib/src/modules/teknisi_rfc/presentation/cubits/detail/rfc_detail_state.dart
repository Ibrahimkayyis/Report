part of 'rfc_detail_cubit.dart';

abstract class RfcDetailState extends Equatable {
  const RfcDetailState();

  @override
  List<Object?> get props => [];
}

class RfcDetailInitial extends RfcDetailState {}

class RfcDetailLoading extends RfcDetailState {}

class RfcDetailLoaded extends RfcDetailState {
  final RfcModel rfc;

  const RfcDetailLoaded(this.rfc);

  @override
  List<Object?> get props => [rfc];
}

class RfcDetailError extends RfcDetailState {
  final String message;

  const RfcDetailError(this.message);

  @override
  List<Object?> get props => [message];
}