import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/src/modules/report_activity/domain/usecase/get_ticket_detail_usecase.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_state.dart';

@injectable
class TicketDetailCubit extends Cubit<TicketDetailState> {
  final GetTicketDetailUseCase _getTicketDetailUseCase;
  final AuthRepository _authRepository;

  TicketDetailCubit(
    this._getTicketDetailUseCase,
    this._authRepository,
  ) : super(TicketDetailInitial());

  Future<void> fetchTicketDetail(String ticketId) async {
    emit(TicketDetailLoading());

    try {
      // 1. Ambil Role User saat ini untuk menentukan endpoint
      final roleString = await _authRepository.getSavedRole();
      final userType = roleString == 'masyarakat' 
          ? UserType.masyarakat 
          : UserType.employee;

      // 2. Panggil UseCase
      final result = await _getTicketDetailUseCase(
        ticketId: ticketId,
        userType: userType,
      );

      emit(TicketDetailLoaded(result));
    } catch (e) {
      emit(TicketDetailError(e.toString()));
    }
  }
}