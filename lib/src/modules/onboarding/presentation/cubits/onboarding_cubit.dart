import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/onboarding/domain/usecase/check_onboarding_status_usecase.dart';
import 'package:report/src/modules/onboarding/domain/usecase/complete_onboarding_usecase.dart';
import 'onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final CheckOnboardingStatusUseCase checkStatus;
  final CompleteOnboardingUseCase completeOnboarding;

  OnboardingCubit({
    required this.checkStatus,
    required this.completeOnboarding,
  }) : super(OnboardingInitial());

  /// Mengecek apakah onboarding sudah pernah selesai
  Future<void> checkOnboarding() async {
    emit(OnboardingChecking());

    try {
      final isCompleted = await checkStatus();

      if (isCompleted) {
        emit(OnboardingCompleted());
      } else {
        emit(OnboardingNotCompleted());
      }
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }

  /// Menandai onboarding sebagai selesai
  Future<void> finishOnboarding() async {
    try {
      await completeOnboarding();
      emit(OnboardingCompleted());
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }
}
