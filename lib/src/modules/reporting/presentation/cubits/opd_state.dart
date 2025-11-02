import 'package:equatable/equatable.dart';
import 'package:report/src/modules/reporting/domain/models/opd_model.dart';

abstract class OpdState extends Equatable {
  const OpdState();

  @override
  List<Object?> get props => [];
}

class OpdInitial extends OpdState {}

class OpdLoading extends OpdState {}

class OpdLoaded extends OpdState {
  final List<OpdModel> opdList;

  const OpdLoaded(this.opdList);

  @override
  List<Object?> get props => [opdList];
}

class OpdError extends OpdState {
  final String message;

  const OpdError(this.message);

  @override
  List<Object?> get props => [message];
}