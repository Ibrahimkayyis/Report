import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/reporting/domain/usecase/get_all_opd_usecase.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_state.dart';

@injectable
class OpdCubit extends Cubit<OpdState> {
  final GetAllOpdUsecase getAllOpdUsecase;

  OpdCubit(this.getAllOpdUsecase) : super(OpdInitial());

  Future<void> fetchOpdList() async {
    emit(OpdLoading());
    try {
      final opdList = await getAllOpdUsecase();
      emit(OpdLoaded(opdList));
    } catch (e) {
      emit(OpdError(e.toString()));
    }
  }
}