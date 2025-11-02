import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/usecase/get_ticket_categories_usecase.dart';
import 'package:report/src/modules/reporting/presentation/cubits/ticket_category_state.dart';

@injectable
class TicketCategoryCubit extends Cubit<TicketCategoryState> {
  final GetTicketCategoriesUseCase _getTicketCategoriesUseCase;

  TicketCategoryCubit(this._getTicketCategoriesUseCase)
      : super(TicketCategoryInitial());

  Future<void> fetchCategories() async {
    emit(TicketCategoryLoading());
    try {
      final categories = await _getTicketCategoriesUseCase.call();
      emit(TicketCategoryLoaded(categories));
    } catch (e) {
      emit(TicketCategoryError(e.toString()));
    }
  }
}
