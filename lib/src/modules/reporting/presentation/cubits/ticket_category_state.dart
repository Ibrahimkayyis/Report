import 'package:equatable/equatable.dart';
import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';

abstract class TicketCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TicketCategoryInitial extends TicketCategoryState {}

class TicketCategoryLoading extends TicketCategoryState {}

class TicketCategoryLoaded extends TicketCategoryState {
  final List<TicketCategoryModel> categories;

  TicketCategoryLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class TicketCategoryError extends TicketCategoryState {
  final String message;

  TicketCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
