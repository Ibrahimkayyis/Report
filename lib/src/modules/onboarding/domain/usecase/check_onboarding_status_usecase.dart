import 'package:injectable/injectable.dart';
import 'package:report/src/modules/onboarding/domain/repositories/onboarding_repository.dart';

@lazySingleton
class CheckOnboardingStatusUseCase {
  final OnboardingRepository repository;

  CheckOnboardingStatusUseCase(this.repository);

  Future<bool> call() {
    return repository.isOnboardingCompleted();
  }
}
